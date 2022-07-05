# https://rstudioconf2022.sched.com/
# https://rstudioconf2022.sched.com/editor
# https://sched.com/api

# TODO: replace generic track names with real room names

library(lubridate)
library(tidyverse)
library(purrr)
library(here)
source(here("R/00_sched-api.R"))

# Gather talk data from .Rmds --------------------------------------------------

talk_data <- read_talk_md(here("sessions"))

talks <-
  tibble(yaml = talk_data$yaml) |>
  unnest_wider(yaml) |>
  select(talk_id, talk_title, talk_materials_url, speakers) |>
  mutate(
    abstract = talk_data$abstract,
    talk_tags = map(talk_data$yaml, "talk_tags") |> map_chr(paste, collapse = ", ")
  )

speakers <-
  talks |>
  select(talk_id, speakers) |>
  unnest_longer(speakers) |>
  unnest_wider(speakers) |>
  unnest_wider(url, names_sep = "_") |>
  mutate(
    photo = paste0(
      "https://raw.githubusercontent.com/rstudio/rstudio-conf-2022-program/main",
      photo
    ),
    bio = if_else(trimws(bio) == "NA", "", bio),
    bio = bio |> map_chr(commonmark::markdown_html),
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

sessions <- read_csv(here("_data/28-session-slug-titles_synched.csv"), col_types = list()) |>
  select(session_slug = slug, session_title = title)

first_upper <- function(x) {
  str_sub(x, 1, 1) <- str_to_upper(str_sub(x, 1, 1))
  x
}

talk_times <- read_csv(here("_data/34-talk-times.csv"), col_types = list()) |>
  make_start_end_relative() |>
  mutate(talk_type = first_upper(talk_type)) |>
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
    `Talk Materials` = talk_materials_url,
    venue = room
  )
program_sched
sched_upsert(program_sched, "session", "session_key", "event_key")

# Update speaker info ----------------------------------------------------------

speaker_sessions <-
  speakers |>
  group_by(username) |>
  summarize(sessions = paste(talk_id, collapse = ","), .groups = "drop")

speaker_sched <-
  speakers |>
  group_by(username) |>
  slice_max(nchar(bio), n = 1, with_ties = FALSE) |>
  transmute(
    username = username,
    role = "speaker",
    full_name = name,
    company = affiliation,
    about = bio,
    avatar = photo,
    url = url_webpage,
    send_email = 0
  ) |>
  left_join(speaker_sessions, by = "username")

tryCatch(
  sched_upsert(speaker_sched, "user", "username", reset_na = FALSE),
  error = function(err) {
    # there are a few known speaker problems (see top of script)
    rlang::inform(conditionMessage(err))
  }
)
