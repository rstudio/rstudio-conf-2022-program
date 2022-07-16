library(googlesheets4)
library(tidyverse)
library(lubridate)
source(here::here("R/00_sched-api.R"))

# Some rooms are pushed to the front since they're used for keynotes/talks.
# Below we'll ensure that the sched venue name is consistent for those rooms.
rooms <- source(here::here("R/00_rooms.R"))$value |>
  select(venue = room, room = room_name)

gs4_auth("*@rstudio.com")

events <- read_sheet(
  "14cupdpbOj_aDQdiee-Db3Gde77JN9HWik73nZW7xMGs",
  sheet = "Social/BoFs"
)

times <- read_sheet("14cupdpbOj_aDQdiee-Db3Gde77JN9HWik73nZW7xMGs") |>
  make_start_end_relative() |>
  select(block, start, end)


all <- sched_GET("session/list")
session_keys <- map_chr(all, "event_key")

social_sched <-
  events |>
  select(id, block, type, title, room, description, tags) |>
  left_join(times, by = "block") |>
  mutate(venue = room) |>
  rows_update(rooms, by = "room", unmatched = "ignore") |>
  transmute(
    session_key = id,
    name = title,
    description = coalesce(description, title),
    description = map_chr(description, commonmark::markdown_html),
    description = gsub("\n<(ul|p|ol)>", "<br><\\1>", description),
    session_start = start,
    session_end = end,
    session_type = type,
    venue
  )

social_sched
sched_upsert(social_sched, "session", "session_key", "event_key")
