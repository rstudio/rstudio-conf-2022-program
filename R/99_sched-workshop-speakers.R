library(googlesheets4)
library(tidyverse)
library(lubridate)
library(glue)
source(here::here("R/00_sched-api.R"))

# [Google Sheets] Get Workshops -------------------------------------------

gs4_auth("*@rstudio.com")

ss <- "1wW2vkBxbV-AYUOA4wRrFPNSodIABWUiHSEL3LDPCgNs"

instructors <-
  read_sheet(ss, "instructors-TAs") |>
  rename(workshop_id = `shortlink-slug`)

all <-
  sched_GET("session/list") |>
  map_dfr(identity) |>
  rename_with(.cols = starts_with("event_"), str_replace, pattern = "event_", replacement = "session_")

workshop_keys <-
  all |>
  filter(session_type == "Workshop") |>
  select(session_key) |>
  mutate(workshop_id = str_remove(session_key, "-\\d-\\d"))

# [sched] Get all sessions for all speakers -------------------------------

speaker_sessions <-
  sched_GET_cached(
    "role/export",
    params = list(role = "speaker", format = "json", fields = "username,sessions")
  ) |>
  xml2::xml_find_first("//body") |>
  xml2::xml_text() |>
  jsonlite::fromJSON(simplifyDataFrame = FALSE) |>
  map_dfr(identity) |>
  left_join(all |> select(id, session_key), by = c(sessions = "id")) |>
  select(username, session_key)

# [sched] Find existing sched users for instructors -----------------------

avatar_url <- function(x) {
  file.path("https://www.rstudio.com/assets/img/2022conf/_workshops", x)
}

sched_instructors <-
  instructors |>
  filter(role == "instructor") |>
  select(workshop_id, full_name = name, email, url = webpage, about = bio, avatar = photo) |>
  mutate(
    across(avatar, avatar_url),
    about = map_chr(about, commonmark::markdown_html)
  ) |>
  mutate(
    sched = sched_users_from_email(email),
    on_sched = map_int(sched, length) > 0
  )

# Prepare instructors with existing sched users ---------------------------

# For instructors already on sched, I need to get their curent session list
# and then possibly modified their role to be speaker with all sesions
instructors_update_session <-
  sched_instructors |>
  filter(on_sched) |>
  select(workshop_id, sched) |>
  hoist(sched, "username") |>
  select(-sched) |>
  left_join(workshop_keys, by = "workshop_id") |>
  group_by(workshop_id, username) |>
  summarize(sessions = paste(session_key, collapse = ","), .groups = "drop") |>
  left_join(speaker_sessions) |>
  mutate(sessions = if_else(
    !is.na(session_key),
    paste0(sessions, ", ", session_key),
    sessions
  )) |>
  select(username, sessions)


# Prepare instructors without existing sched accounts ---------------------

# For instructors who aren't yet on sched, we have to create their accounts,
# (setting send_email = 1) and add them to their sessions.
instructors_add_user <-
  sched_instructors |>
  filter(!on_sched) |>
  select(-contains("sched")) |>
  mutate(
    username = full_name |> tolower() |> str_replace_all("[-' ]", "_"),
    username = str_replace_all(username, "é", "e"),
    role = "speaker",
  ) |>
  nest(user_info = c(-workshop_id, -username)) |>
  left_join(workshop_keys, by = "workshop_id") |>
  group_by(workshop_id, username, user_info) |>
  summarize(sessions = paste(session_key, collapse = ","), .groups = "drop") |>
  select(-workshop_id) |>
  unnest_wider(user_info)


# Update sched ------------------------------------------------------------

if (FALSE) {
  # Modify the sessions of workshop instructors with existing accounts
  # being careful not to accidentally drop them from their other sessions
  res_update <- pmap(instructors_update_session, safely(sched_user_mod_speaker_role))

  # Create new sched users for workshop instructors who don't currently have
  # a sched account (and send the email by not overriding the default)
  sched_upsert(instructors_add_user, "user", "username")
}
