source(here::here("R/00_utils.R"))

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
      html
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
sched_GET_cached <- memoise::memoise(
  sched_GET,
  cache = cachem::cache_mem(max_age = 60)
)

sched_upsert <- function(data, type, write_key, list_key = write_key) {
  # Convert NA to empty strings to reset API values
  data <- data |>
    mutate(across(where(is.character), ~ coalesce(.x, "")))

  # Determine whether to add or mod
  all <- sched_GET_cached(glue::glue("{type}/list"))
  existing_keys <- map_chr(all, list_key)
  url <- paste0(type, "/", ifelse(data[[write_key]] %in% existing_keys, "mod", "add"))

  cli::cli_progress_bar(glue::glue("Updating {type}"), total = nrow(data))
  ret <- vector("list", nrow(data))
  for (i in 1:nrow(data)) {
    row <- as.list(data[i, ])
    ret[[row[[write_key]]]] <- safely(sched_POST)(url[[i]], row)
    cli::cli_progress_update(status = row[[write_key]])
  }
  stop_for_errors(ret, glue::glue("sched upsert to `{type}/[mod,add]`"))
  invisible(purrr::map(ret, "results"))
}

sched_user_mod_speaker_role <- function(username, sessions, action = "add") {
  stopifnot(
    "one user at a time" = length(username) == 1,
    "action is 'add' or 'del'" = action %in% c("add", "del")
  )

  params <- list(
    username = username,
    sessions = paste(sessions, collapse = ","),
    role = "speaker",
    send_email = 0
  )

  sched_POST(glue::glue("role/{action}"), params)
}
