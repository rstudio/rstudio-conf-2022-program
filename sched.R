# https://rstudioconf2022.sched.com/
# https://rstudioconf2022.sched.com/editor
# https://sched.com/api

# TODO: figure out what's wrong with david_smith, colin_gillespie,
#   david_robinson, and nick_strayer - need unique prefix?
# TODO: figure out why Mine's info is missing
# TODO: extract out repeated date-time code
# TODO: replace generic track names with real room names

library(lubridate)
library(tidyverse)
library(purrr)
source("sched-api.R")

# Gather talk data from .Rmds --------------------------------------------------

paths <- fs::dir_ls("sessions", recurse = TRUE, glob = "*.md")

files <- paths |> map(readLines)
data <- files |> map(rmarkdown:::partition_yaml_front_matter)

yaml <- data |> map("front_matter") |> map(safely(yaml::yaml.load))

if (some(yaml, ~ !is.null(.x$error))) {
  errors <- yaml |> map("error") |> discard(is.null) |> imap_chr(
    ~ sprintf("{.path %s}: %s", .y, conditionMessage(.x))
  )
  names(errors) <- rep_len("x", length(errors))
  cli::cli_abort(c("Failed to parse YAML front matter of {length(errors)} talk{?s}.", errors))
} else {
  yaml <- yaml |> map("result")
}

abstracts <- data |>
  map("body") |>
  map_chr(~ paste(.x[-(1:5)], collapse = "\n")) |>
  map_chr(commonmark::markdown_html)

talks <- tibble(yaml = yaml) |>
  unnest_wider(yaml) |>
  select(talk_id, talk_title, speakers) |>
  mutate(
    abstract = abstracts,
    talk_tags = map(yaml, "talk_tags") |> map_chr(paste, collapse = ", ")
  )
speakers <- talks |>
  select(talk_id, speakers) |>
  unnest_longer(speakers) |>
  unnest_wider(speakers) |>
  unnest_wider(url, names_sep = "_") |>
  mutate(
    photo = paste0(
      "https://raw.githubusercontent.com/rstudio/rstudio-conf-2022-program/main",
      photo
    ),
    bio = bio |> map(commonmark::markdown_html),
  )

# Combine with talk times to generate program -----------------------------

# Made up room names for now
rooms <- tribble(
  ~ track, ~ room,
  "plenary", "Nile",
  "A", "Amazon",
  "B", "Yangtze",
  "C", "Mississippi",
  "D", "Yenisey"
)

sessions <- read_csv("_data/28-session-slug-titles_synched.csv", col_types = list()) |>
  select(session_slug = slug, session_title = title)

first_upper <- function(x) {
  str_sub(x, 1, 1) <- str_to_upper(str_sub(x, 1, 1))
  x
}

talk_times <- read_csv("_data/34-talk-times.csv", col_types = list()) |>
  mutate(
    date = ymd("2022-07-25", tz = "America/Detroit") + days(day - 1),
    start = date + start,
    end = date + end,
    talk_type = first_upper(talk_type)
  ) |>
  left_join(sessions, by = "session_slug") |>
  select(-session_slug, -date) |>
  left_join(rooms, by = "track")

program <- talks |> left_join(talk_times, by = "talk_id")
program |> count(day)
#> # A tibble: 2 × 2
#>     day     n
#>   <dbl> <int>
#> 1     3    42
#> 2     4    57

# Update program ----------------------------------------------------------

program_sched <- program %>%
  transmute(
    session_key = talk_id,
    name = talk_title,
    description = abstract,
    session_type = ifelse(talk_type == "Keynote", "Keynote", paste0("Track ", track)),
    session_subtype = ifelse(talk_type == "Regular", session_title, NA),
    session_start = start,
    session_end = end,
    tags = talk_tags,
    venue = room
  )
program_sched
sched_upsert(program_sched, "session", "session_key", "event_key")

# Update speaker info ----------------------------------------------------------

speaker_sched <- speakers |> transmute(
  username = slug |> str_replace_all("-", "_") |> iconv(to = "ASCII//translit"),
  role = "speaker",
  full_name = name,
  company = affiliation,
  about = bio,
  avatar = photo,
  sessions = talk_id,
  send_email = 0
)
sched_upsert(speaker_sched, "user", "username")
