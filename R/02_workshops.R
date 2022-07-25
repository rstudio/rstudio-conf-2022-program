library(googlesheets4)
library(tidyverse)
library(lubridate)
library(glue)
source(here::here("R/00_sched-api.R"))

gs4_auth("*@rstudio.com")

workshops <- read_sheet("1wW2vkBxbV-AYUOA4wRrFPNSodIABWUiHSEL3LDPCgNs")

rooms <-
  source(here::here("R/00_rooms.R"))$value |>
  mutate(room = coalesce(room, room_name)) |>
  select(`shortlink-slug` = track, room)

times <- read_sheet("14cupdpbOj_aDQdiee-Db3Gde77JN9HWik73nZW7xMGs")
workshop_times <- times |>
  filter(day %in% 1:2, name == "workshop") |>
  make_start_end_relative() |>
  select(day, order, start, end)

all <- sched_GET("session/list")
session_keys <- map_chr(all, "event_key")

workshops_sched <-
  workshops |>
  select(-room) |>
  left_join(rooms, by = "shortlink-slug") |>
  left_join(workshop_times, by = character()) |>
  mutate(
    rstudio_url = glue("https://www.rstudio.com/conference/2022/workshops/{slug}/", slug = `shortlink-slug`),
    description = glue('{Summary} View <a href="{rstudio_url}" target="_blank">full workshop details</a>.')
  ) |>
  transmute(
    session_key = paste0(`shortlink-slug`, "-", day, "-", order),
    name = title,
    description = map_chr(description, commonmark::markdown_html),
    session_start = start,
    session_end = end,
    session_type = "Workshop",
    tags = paste0("workshop:", `shortlink-slug`),
    venue = as.character(room)
  ) |>
  mutate(across(where(is.character), ~ coalesce(.x, "")))

workshops_sched
sched_upsert(workshops_sched, "session", "session_key", "event_key")
