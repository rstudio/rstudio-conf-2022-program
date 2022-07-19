library(googlesheets4)
library(tidyverse)
library(lubridate)
library(glue)
source(here::here("R/00_sched-api.R"))

gs4_auth("*@rstudio.com")


# Functions ---------------------------------------------------------------
first_upper <- function(x) {
  str_sub(x, 1, 1) <- str_to_upper(str_sub(x, 1, 1))
  x
}


# Load data ---------------------------------------------------------------

talk_data <- read_talk_md()
workshops <- read_sheet("1wW2vkBxbV-AYUOA4wRrFPNSodIABWUiHSEL3LDPCgNs")
times <- read_sheet("14cupdpbOj_aDQdiee-Db3Gde77JN9HWik73nZW7xMGs")

sessions <-
  here::here("_data/28-session-slug-titles_synched.csv") |>
  read_csv(col_types = list()) |>
  select(session_slug = slug, session_title = title)


# Prep Talk Times ---------------------------------------------------------
rooms <-
  source(here::here("R/00_rooms.R"))$value |>
  select(track, room = room_name)

talk_times <-
  here::here("_data/34-talk-times.csv") |>
  read_csv(col_types = list()) |>
  left_join(sessions, by = "session_slug") |>
  mutate(
    talk_type = first_upper(talk_type),
    session_title = coalesce(session_title, talk_type),
    across(c(start, end), strftime, format = "%I:%M%P")
  ) |>
  left_join(rooms, by = "track") |>
  mutate(
    track = case_when(
      talk_type == "Keynote" ~ "Plenary",
      TRUE ~ paste("Track", room)
    )
  ) |>
  group_by(block) |>
  mutate(session_start = min(start), session_end = max(end)) |>
  ungroup() |>
  mutate(
    day = case_when(
      day == 3 ~ "July 27",
      day == 4 ~ "July 28"
    )
  ) |>
  select(
    day, session_start, session_end,
    talk_type, room, session_title, track,
    session_slug,
    talk_id, start, end
  )


# Talks -------------------------------------------------------------------

speaker_with_affiliation <- function(speaker) {
  affiliation <- speaker$affiliation
  name <- speaker$name
  if (is.null(affiliation)) return(name)
  affiliation <- sub("RStudio,? PBC", "RStudio", affiliation)
  sprintf("%s, %s", name, affiliation)
}

talks <-
  tibble(yaml = talk_data$yaml) |>
  unnest_wider(yaml) |>
  select(talk_id, talk_title, talk_title_short, speakers) |>
  mutate(
    talk_title_short = map_chr(talk_title_short, paste, collapse = " "),
    talk_title_short = recode(talk_title_short, "NULL" = NA_character_),
    talk_title_short = coalesce(talk_title_short, talk_title),
    speakers = map(speakers, map_chr, speaker_with_affiliation)
  ) |>
  unnest(speakers) |>
  group_by(talk_id, talk_title, talk_title_short) |>
  summarize(speakers = paste(speakers, collapse = " & "), .groups = "drop")

talks_summary <-
  left_join(talk_times, talks, by = "talk_id")

# Workshops ---------------------------------------------------------------

workshops_summary <-
  workshops |>
  mutate(
    instructor = coalesce(instructor, instructor_short),
    instructor = str_replace_all(instructor, " \\+ ", ", "),
    across(room, as.character)
  ) |>
  select(title, title_short, instructor, room) |>
  replace_na(list(room = "TBD"))


# Session Summary ---------------------------------------------------------

session_summary <-
  talks_summary |>
  select(day, session_slug, session_start, session_end, talk_type, room, session_title, track) |>
  distinct()

# Push to sheet -----------------------------------------------------------

id <- "1e0V_HwCVcgqImlj2XymzMHu_tOfgxvk86jdqpCIKHD0"

write_sheet(talks_summary, id, sheet = "Talks")
write_sheet(workshops_summary, id, sheet = "Workshops")
write_sheet(session_summary, id, sheet = "Session Summary")
