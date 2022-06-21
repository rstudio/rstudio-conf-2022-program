read_talk_md <- function(path = NULL) {
  if (is.null(path)) {
    path <- here::here("sessions")
  }

  if (fs::is_dir(path)) {
    paths <- fs::dir_ls(path, recurse = TRUE, glob = "*.md")
  } else {
    stopifnot(
      "path(s) must exist" = all(fs::file_exists(path)),
      "path(s) must have `.md` extension" = all(fs::path_ext(path) == "md")
    )
    paths <- path
  }

  files <- paths |> purrr::map(readLines)
  data <- files |> purrr::map(rmarkdown:::partition_yaml_front_matter)

  yaml <- data |>
    purrr::map("front_matter") |>
    purrr::map(purrr::safely(yaml::yaml.load))

  yaml |> stop_for_errors("parse YAML front matter")
  yaml <- yaml |> purrr::map("result")

  abstract <-
    data |>
    purrr::map("body") |>
    purrr::map_chr(~ paste(.x[-(1:5)], collapse = "\n")) |>
    purrr::map_chr(commonmark::markdown_html)

  list(files = files, yaml = yaml, abstract = abstract)
}

make_start_end_relative <- function(.x, day_one = "2022-07-25") {
  missing <- setdiff(c("day", "start", "end"), names(.x))
  if (length(missing)) {
    rlang::abort(paste("Expected columns:", paste(missing, collapse = ', ')))
  }

  day_one <- lubridate::ymd("2022-07-25", tz = "America/New_York")

  .x |> mutate(
    date = day_one + lubridate::days(day - 1),
    start = date + hms::as_hms(start),
    end = date + hms::as_hms(end)
  )
}

stop_for_errors <- function(results, task) {
  if (purrr::some(results, ~ !is.null(.x$error))) {
    errors <-
      results |>
      purrr::map("error") |>
      purrr::discard(is.null) |>
      purrr::imap_chr(
        ~ glue::glue("{{.path {name}}}: {error}", name = .y, error = conditionMessage(.x))
      )
    names(errors) <- rep_len("x", length(errors))
    cli::cli_abort(c("{length(errors)} error{?s} ocurred when trying to {task}", errors))
  }
}
