library(googlesheets4)
library(tidyverse)
source("sched-api.R")

gs4_auth("*@rstudio.com")

events <- read_sheet(
  "14cupdpbOj_aDQdiee-Db3Gde77JN9HWik73nZW7xMGs",
  sheet = "Social/BoFs"
)

times <- read_sheet("14cupdpbOj_aDQdiee-Db3Gde77JN9HWik73nZW7xMGs") |>
  mutate(
    date = ymd("2022-07-25", tz = "America/Detroit") + days(day - 1),
    start = date + hms::as_hms(start),
    end = date + hms::as_hms(end),
  ) |>
  select(block, start, end)


all <- sched_GET("session/list")
session_keys <- map_chr(all, "event_key")

social_sched <- events |>
  select(id, block, type, title, room, description, tags) |>
  left_join(times, by = "block") |>
  transmute(
    session_key = id,
    name = title,
    description = description,
    session_start = start,
    session_end = end,
    session_type = type,
    venue = room,
    path = ifelse(session_key %in% session_keys, "session/mod", "session/add"),
  )

social_sched
sched_upsert(social_sched, "session", "session_key", "event_key")
