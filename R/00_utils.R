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
