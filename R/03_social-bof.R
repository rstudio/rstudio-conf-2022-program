library(googlesheets4)
library(tidyverse)
library(lubridate)
source(here::here("R/00_sched-api.R"))

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

social_sched <- events |>
  select(id, block, type, title, room, description, tags) |>
  left_join(times, by = "block") |>
  transmute(
    session_key = id,
    name = title,
    description = coalesce(description, title),
    description = map_chr(description, commonmark::markdown_html),
    session_start = start,
    session_end = end,
    session_type = type,
    venue = room
  )

social_sched
sched_upsert(social_sched, "session", "session_key", "event_key")
