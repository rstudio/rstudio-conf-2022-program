library(tidyverse)
source(here::here("R/00_utils.R"))

talks <- read_talk_md()

profile_image_url <- function(path) {
  path <- sub("^/", "", path)
  file.path(
    "https://raw.githubusercontent.com/rstudio/rstudio-conf-2022-program/main",
    path
  )
}

talk_data <-
  talks$yaml |>
  map(function(talk) {
    title <- talk$talk_title
    if (nchar(title) >= 66) {
      title <- talk$talk_title_short
    }
    list(
      title = title,
      slug = talk$talk_slug,
      session = talk$session_slug,
      speakers = map(talk$speakers, function(spkr) {
        list(name = spkr$name, image = profile_image_url(spkr$photo))
      })
    )
  })

avoid_breaks <- function(text) {
  phrases <- c(
    "((to|in) the|to|the|) (Quarto|tidyverse|ggplot2|tidymodels)",
    "R and Friends",
    "for Shiny and RMarkdown",
    "R and Shiny",
    "RStudio Connect",
    "R Markdown",
    "R[ -]Shiny",
    "R package",
    " R workflows",
    "Shiny apps?",
    "Shiny applications",
    "Apple Health Export",
    "Lessons from Pharma",
    "A love triangle",
    "A poorly optimized",
    "Data science products",
    "Share with Quarto",
    "without a server",
    "Creating amazing",
    "just need words",
    "in the browser",
    "with RStudio",
    "Apache Arrow",
    "GitHub Actions",
    "to the \"Non-Datas\"",
    "Solo Contributor",
    "in intro stats",
    "multi-lingual teams",
    "Data Science Course",
    "Data Science Success",
    "becoming more creative",
    "in west Africa",
    "and Low-Tech",
    "for enterprise",
    "to the cloud",
    "Multilingual Shiny Apps",
    "\\$15 computer",
    "(with|on|and|of|using) \\w+$"
  )
  gsub(
    sprintf("(%s)", paste(phrases, collapse = "|")),
    '<span class="avoid-break">\\1</span>',
    text,
    ignore.case = TRUE
  )
}

make_social_card <- function(talk, style = "talk-opt1", render_only = FALSE) {
  outfile <- fs::path(
    "sessions",
    talk$session,
    talk$slug,
    paste0(talk$slug, "_", style),
    ext = "png"
  )
  fs::dir_create(fs::path_dir(outfile))

  talk$slug <- NULL
  talk$session <- NULL
  talk$style <- style
  talk$title <- avoid_breaks(talk$title)

  tmpfile <- fs::path_file(outfile)
  tmpfile <- fs::path_ext_set(tmpfile, "Rmd")
  fs::file_copy("social-cards.Rmd", tmpfile)
  withr::defer(unlink(tmpfile))

  tmp_out <- fs::path_ext_set(tmpfile, "html")
  if (!render_only) {
    withr::defer(unlink(tmp_out))
  }

  rmarkdown::render(
    input = tmpfile,
    output_file = tmp_out,
    params = talk,
    quiet = TRUE,
    output_options = list(self_contained = TRUE)
  )

  if (render_only) return(invisible(tmp_out))

  webshot2::webshot(
    tmp_out,
    outfile,
    vwidth = 1600,
    vheight = 900,
    selector = ".card-container"
  )
}

make_all_social_cards <- function(talk_data) {
  library(furrr)
  future::plan(future::multisession(workers = 7))

  future_walk(
    talk_data,
    ~ walk(paste0("talk-opt", 1:4), make_social_card, talk = .x)
  )
}

if (!interactive()) {
  make_all_social_cards(talk_data)
}
