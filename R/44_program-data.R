library(lubridate)
library(tidyverse)
library(purrr)
library(here)
source(here("R/00_sched-api.R"))

first_upper <- function(x) {
  str_sub(x, 1, 1) <- str_to_upper(str_sub(x, 1, 1))
  x
}

prep_speaker <- function(speaker) {
  speaker$photo <- paste0(
    "https://raw.githubusercontent.com/rstudio/rstudio-conf-2022-program/main",
    speaker$photo
  )
  speaker$bio <- if_else(trimws(speaker$bio) == "NA", "", speaker$bio)
  speaker$bio <- commonmark::markdown_html(speaker$bio)
  speaker
}


# Gather talk data from .Rmds --------------------------------------------------

talk_data <- read_talk_md(here("sessions"))

talks <-
  talk_data[c("yaml", "abstract")] |>
  as_tibble() |>
  unnest_wider(yaml) |>
  mutate(
    talk_type = first_upper(talk_type),
    speakers = map(speakers, map, prep_speaker)
  )


# Combine with talk times to generate program -----------------------------
slido <- read_csv(here("R/slido.csv"))

rooms <- source(here("R/00_rooms.R"))$value |>
  left_join(slido, by = "room_name") |>
  select(track, room = room_name, slido)

sessions <-
  here("_data/28-session-slug-titles_synched.csv") |>
  read_csv(col_types = list()) |>
  select(session_slug = slug, session_title = title) |>
  mutate(session_title = if_else(
    str_detect(session_title, "R be nimble"),
    "Rapidly responding to world events with R",
    session_title
  ))

all_times <-
  read_csv(here("_data/34-talk-times.csv"), col_types = list()) |>
  make_start_end_relative() |>
  left_join(sessions, by = "session_slug")

session_times <-
  all_times |>
  group_by(session_slug) |>
  summarize(
    session_day = strftime(min(start), "%F"),
    session_start = min(start),
    session_end = max(end),
    .groups = "drop"
  ) |>
  mutate(
    across(c(session_start, session_end), list(local = ~ strftime(.x, "%I:%M %p", tz = "America/New_York"))),
    across(c(session_start, session_end), strftime, "%FT%TZ%Z", tz = "America/New_York")
  )

talk_times <-
  all_times |>
  select(-session_slug, -date, -talk_type) |>
  left_join(rooms, by = "track") |>
  mutate(
    day = strftime(start, "%F", tz = "America/New_York"),
    across(c(start, end), list(local = ~ strftime(.x, "%I:%M %p", tz = "America/New_York"))),
    across(c(start, end), strftime, "%FT%TZ%Z", tz = "America/New_York")
  )

# Build Program -----------------------------------------------------------

program <-
  talks |>
  mutate(session_slug = if_else(talk_type == "Keynote", talk_slug, session_slug)) |>
  left_join(talk_times, by = "talk_id") |>
  left_join(session_times, by = "session_slug") |>
  mutate(session_title = if_else(talk_type == "Keynote", paste("Keynote:", talk_title), session_title)) |>
  rename(talk_abstract = abstract, session_room = room, session_slido = slido) |>
  rename_with(~ paste0("talk_", .x), c(day, start, start_local, end, end_local, sched_url)) |>
  nest(
    session = contains("session"),
    talk = c(contains("talk_")),
    .names_sep = "_"
  ) |>
  select(talk, session, speakers)

# Write program json ------------------------------------------------------

program_list <-
  program |>
  apply(1, function(talk) {
    talk <- as.list(talk)
    talk <- map_if(talk, is_tibble, as.list)
    talk$talk$tags <- I(talk$talk$tags[[1]]) # flatten but ensure array in json
    talk
  })

names(program_list) <- program_list |> map("talk") |> map_chr("slug")

jsonlite::write_json(
  program_list,
  here("program.json"),
  auto_unbox = TRUE,
  null = "null",
  pretty = 2
)
