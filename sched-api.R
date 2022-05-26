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
