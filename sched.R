# https://rstudioglobal2021.sched.com/editor/
# https://sched.com/api

# TODO: replace generic track names with room names
# TODO: add workshops (https://docs.google.com/spreadsheets/d/1wW2vkBxbV-AYUOA4wRrFPNSodIABWUiHSEL3LDPCgNs/edit#gid=0)
# TODO: add speaker info

library(lubridate)
library(tidyverse)
library(purrr)

# Gather talk data from .Rmds --------------------------------------------------

paths <- setdiff(fs::dir_ls(recurse = TRUE, glob = "*.md"), "README.md")

files <- paths |> map(readLines)
data <- files |> map(rmarkdown:::partition_yaml_front_matter)

yaml <- data |> map("front_matter") |> map(possibly(yaml::yaml.load, NULL))
abstracts <- data |>
  map("body") |>
  map_chr(~ paste(.x[-(1:5)], "\n", collapse = ""))

talks <- tibble(
  talk_id = map_int(yaml, "talk_id", .default = NA),
  talk_title = map_chr(yaml, "talk_title", .default = NA),
  abstract = abstracts,
  tags = map(yaml, "tags", .default = NULL)
)
talks

# Combine with talk times to generate program -----------------------------

sessions <- read_csv("_data/28-session-slug-titles_synched.csv", col_types = list()) |>
  select(session_slug = slug, session_title = title)

talk_times <- read_csv("_data/34-talk-times.csv", col_types = list()) |>
  mutate(
    date = ymd("2022-07-25", tz = "America/Detroit") + days(day - 1),
    start = date + start,
    end = date + end,
  ) |>
  left_join(sessions, by = "session_slug") |>
  select(-session_slug, -date)

program <- talks |> left_join(talk_times, by = "talk_id")
program |> count(day)

program_sched <- program %>%
  transmute(
    session_key = talk_id,
    name = talk_title,
    description = abstract,
    session_type = talk_type,
    session_subtype = ifelse(talk_type == "regular", session_title, NA),
    tags = tags,
    venue = track
  )
program_sched

# Update sched ------------------------------------------------------------

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

all <- sched_GET("session/list")
keys <- as.integer(map_chr(all, "event_key"))

cli::cli_progress_bar("Updating schedule", total = nrow(program_sched))
for (i in 1:nrow(program_sched)) {
  row <- as.list(program_sched[i, ])

  # Replace NA with ""
  is_na <- unname(map_lgl(row, ~ length(.x) == 1 && is.na(.x)))
  row[is_na] <- ""

  if (row$session_key %in% keys) {
    sched_POST("session/mod", row)
  } else {
    sched_POST("session/add", row)
  }
  cli::cli_progress_update()
}
