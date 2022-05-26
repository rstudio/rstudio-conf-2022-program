library(googlesheets4)
library(tidyverse)
source("sched-api.R")

gs4_auth("*@rstudio.com")

workshops <- read_sheet("1wW2vkBxbV-AYUOA4wRrFPNSodIABWUiHSEL3LDPCgNs")


times <- read_sheet("14cupdpbOj_aDQdiee-Db3Gde77JN9HWik73nZW7xMGs")
workshop_times <- times |>
  filter(day %in% 1:2, name == "workshop") |>
  mutate(
    date = ymd("2022-07-25", tz = "America/Detroit") + days(day - 1),
    start = date + hms::as_hms(start),
    end = date + hms::as_hms(end),
  ) |>
  select(day, order, start, end)

all <- sched_GET("session/list")
session_keys <- map_chr(all, "event_key")

workshops_sched <- workshops |>
  left_join(workshop_times, by = character()) |>
  transmute(
    session_key = paste0(`shortlink-slug`, "-", day, "-", order),
    name = title,
    description = Summary,
    session_start = start,
    session_end = end,
    session_type = "Workshop",
    room = as.character(room),
    path = ifelse(session_key %in% session_keys, "session/mod", "session/add"),
  ) |>
  mutate(across(where(is.character), ~ coalesce(.x, "")))
workshops_sched

cli::cli_progress_bar("Updating workshops", total = nrow(workshops_sched))
for (i in 1:nrow(workshops_sched)) {
  row <- as.list(workshops_sched[i, ])
  sched_POST(row$path, row)
  cli::cli_progress_update()
}
