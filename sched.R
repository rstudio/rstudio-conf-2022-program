# https://rstudioconf2022.sched.com/
# https://rstudioconf2022.sched.com/editor
# https://sched.com/api

# TODO: figure out what's wrong with david_smith, colin_gillespie,
#   david_robinson, and nick_strayer - need unique prefix?

# TODO: add workshops (https://docs.google.com/spreadsheets/d/1wW2vkBxbV-AYUOA4wRrFPNSodIABWUiHSEL3LDPCgNs/edit#gid=0)
# TODO: replace generic track names with real room names

library(lubridate)
library(tidyverse)
library(purrr)

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

talk_times <- read_csv("_data/34-talk-times.csv", col_types = list()) |>
  mutate(
    date = ymd("2022-07-25", tz = "America/Detroit") + days(day - 1),
    start = date + start,
    end = date + end,
  ) |>
  left_join(sessions, by = "session_slug") |>
  select(-session_slug, -date) |>
  left_join(rooms, by = "track") |>
  select(-track)

program <- talks |> left_join(talk_times, by = "talk_id")
program |> count(day)

# sched API ------------------------------------------------------------

sched <- function(method, endpoint, params = list(), ...) {
  params$api_key <- Sys.getenv("SCHED_CONF_2022")
  if (method == "GET") {
    params$format <- "json"
  }
  url <- paste0("https://rstudioconf2022.sched.com/api/", endpoint)
  r <- httr::VERB(method, url, query = params, ...)

  if (grepl("text/html", httr::headers(r)$`Content-Type`)) {
    html <- httr::content(r, "parsed")
    p <- xml2::xml_text(xml2::xml_find_first(html, ".//p"))
    if (grepl("ERR", p)) {
      stop(p, call. = FALSE)
    } else {
      list()
    }
  } else {
    httr::content(r, "parsed")
  }
}
sched_GET <- function(endpoint, params = list(), ...) {
  sched("GET", endpoint, params = params, ...)
}
sched_POST <- function(endpoint, params = list(), ...) {
  sched("POST", endpoint, params = params, ...)
}

# Update program ----------------------------------------------------------

all <- sched_GET("session/list")
keys <- as.integer(map_chr(all, "event_key"))

program_sched <- program %>%
  transmute(
    session_key = talk_id,
    name = talk_title,
    description = abstract,
    session_type = talk_type,
    session_subtype = ifelse(talk_type == "regular", session_title, NA),
    tags = talk_tags,
    venue = room,
    path = ifelse(talk_id %in% keys, "session/mod", "session/add"),
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
