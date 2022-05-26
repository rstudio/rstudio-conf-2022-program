# https://rstudioconf2022.sched.com/
# https://rstudioconf2022.sched.com/editor
# https://sched.com/api

# TODO: figure out what's wrong with david_smith, colin_gillespie,
#   david_robinson, and nick_strayer - need unique prefix?
# TODO: figure out why Mine's info is missing
# TODO: extract out repeated progress code
# TODO: replace generic track names with real room names

library(lubridate)
library(tidyverse)
library(purrr)
source("sched-api.R")

# Gather talk data from .Rmds --------------------------------------------------

paths <- fs::dir_ls("sessions", recurse = TRUE, glob = "*.md")

files <- paths |> map(readLines)
data <- files |> map(rmarkdown:::partition_yaml_front_matter)

yaml <- data |> map("front_matter") |> map(yaml::yaml.load)

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
  left_join(rooms, by = "track") |>
  select(-track)

program <- talks |> left_join(talk_times, by = "talk_id")
program |> count(day)

# Update program ----------------------------------------------------------

all <- sched_GET("session/list")
session_keys <- as.integer(map_chr(all, "event_key"))

program_sched <- program %>%
  transmute(
    session_key = talk_id,
    name = talk_title,
    description = abstract,
    session_type = talk_type,
    session_subtype = ifelse(talk_type == "Regular", session_title, NA),
    session_start = start,
    session_end = end,
    tags = talk_tags,
    venue = room,
    path = ifelse(session_key %in% session_keys, "session/mod", "session/add"),
  ) |>
  # Convert NA to empty strings to reset API values
  mutate(across(where(is.character), ~ coalesce(.x, "")))
program_sched

cli::cli_progress_bar("Updating schedule", total = nrow(program_sched))
for (i in 1:nrow(program_sched)) {
  row <- as.list(program_sched[i, ])
  sched_POST(row$path, row)
  cli::cli_progress_update()
}

# Update speaker info ----------------------------------------------------------

all <- sched_GET("user/list")
present <- map_chr(all, "username")

speaker_sched <- speakers |> transmute(
  username = slug |> str_replace_all("-", "_") |> iconv(to = "ASCII//translit"),
  role = "speaker",
  full_name = name,
  company = affiliation,
  about = bio,
  avatar = photo,
  sessions = talk_id,
  send_email = 0,
  path = ifelse(username %in% present, "user/mod", "user/add"),
) |>
  # Convert NA to empty strings to reset API values
  mutate(across(where(is.character), ~ coalesce(.x, "")))

speaker_sched

cli::cli_progress_bar("Updating speakers", total = nrow(speaker_sched))
for (i in 1:nrow(speaker_sched)) {
  row <- as.list(speaker_sched[i, ])
  tryCatch(
    sched_POST(row$path, row),
    error = function(err) {
      cli::cli_inform("Failed to upload {row$username}", parent = err)
    }
  )
  cli::cli_progress_update()
}
