library(tidyverse)
source(here::here("R/00_sched-api.R"))
DO_MIGRATION <- FALSE

# Get Talk Data -----------------------------------------------------------
talks <- read_talk_md()

talk_paths <-
  talks$yaml |>
  map_dfr(`[`, "talk_id", .id = "path") |>
  mutate(path = fs::path_rel(path, here::here()))

speaker_username_ours <-
  talks$yaml |>
  map_dfr(`[`, c("talk_id", "speakers")) |>
  mutate(across(speakers, map_dfr, `[`, c("name", "username"))) |>
  unnest_wider(speakers) |>
  rename(username_ours = username)

talk_current_username <-
  talk_paths |>
  left_join(speaker_username_ours, by = "talk_id", "name")

# Gather Speaker Emails (not in this repo) --------------------------------
speaker_emails_internal <-
  list(
    regular = read_csv("../conf-2022-pc/program-data/36-speakers-regular.csv"),
    lightning = read_csv("../conf-2022-pc/program-data/36-speakers-lightning.csv")
  ) |>
  bind_rows() |>
  select(talk_id, name, email)

if (fs::file_exists("_data/keynote-emails.csv")) {
  rstudio_keynote_emails <- read_csv("_data/keynote-emails.csv")

  speaker_emails_internal <- bind_rows(speaker_emails_internal, rstudio_keynote_emails)
}

speaker_emails <-
  full_join(
    talk_current_username,
    speaker_emails_internal,
    by = c("talk_id", "name")
  )

speaker_emails |>
  filter(is.na(email))


# Lookup sched user by email ----------------------------------------------
speaker_sched_user <-
  speaker_emails |>
  filter(!is.na(email)) |>
  mutate(sched_user = sched_users_from_email(email)) |>
  hoist(sched_user, username = "username")



# Update existing sched users ---------------------------------------------
# 1. Modify existing user to have speaker role with the correct talk
# 1. Remove speaker role from previous user
# 1. Update the talk yaml
sched_swap_speaker_user <- function(username_ours, username, email, sessions, path) {
  sched_user_mod_speaker_role(username, sessions, action = "add")
  sched_user_mod_speaker_role(username_ours, sessions, action = "del")
  talk_yaml_speaker_updated(path, old = username_ours, new = username)
  cli::cli_alert_success("{.field {username_ours}} --> {.field {username}} ({.email {email}})")
}

talk_yaml_speaker_updated <- function(path, old, new) {
  updated <- current <- readLines(path)
  old_user_line <- sprintf("  username: %s", old)
  new_user_line <- sprintf("  username: %s", new)
  idx_user_line <- which(trimws(current, which = "right") == old_user_line)
  if (!length(idx_user_line)) {
    cli::cli_alert_danger(c(
      "Could not replace user in {.path {path}}",
      x = "{.val {old}} --> {.val {new}}"
    ))
    return()
  }
  updated[idx_user_line] <- new_user_line
  writeLines(updated, path)
}

speaker_sched_user |>
  count(already_on_sched = !is.na(username))

speaker_existing_to_update <-
  speaker_sched_user |>
  filter(!is.na(username)) |>
  select(sessions = talk_id, email, path, username_ours, username)

# speakers to be updated only have one talk
speaker_existing_to_update |>
  group_by(email, username_ours, username) |>
  count()

# all are unique
speaker_existing_to_update |>
  count(email, sort = TRUE)

# Zero rows (no paths are missing)
speaker_existing_to_update |>
  filter(is.na(path))

if (isTRUE(DO_MIGRATION)) {
  speaker_existing_to_update |>
    pwalk(sched_swap_speaker_user)
}



# Add emails to non-pre-existing shed users -------------------------------
# 1. Modify user to add their email
sched_add_user_email <- function(username, email, sessions) {
  sched_POST("user/mod", params = list(
    username = username,
    email = email,
    sessions = sessions
  ))
  cli::cli_alert_success("Added {.email {email}} to {.field {username}}")
}

speaker_new_user_to_add_email <-
  speaker_sched_user |>
  filter(is.na(username)) |>
  select(sessions = talk_id, username = username_ours, email) |>
  group_by(username, email) |>
  summarize(sessions = paste(sessions, collapse = ","))

if (isTRUE(DO_MIGRATION)) {
  speaker_new_user_to_add_email |> pwalk(sched_add_user_email)
}
