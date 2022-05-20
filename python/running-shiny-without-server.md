---
# Do not edit
talk_id: 22232
talk_slug: running-shiny-without-server
talk_type: regular
session_slug: python
block: 4-4-session
# ---- Edit information below this line ----
# The title of your talk
talk_title: Running Shiny without a server
# A short version of the title, suitable for small displays
talk_title_short: Running Shiny without a server
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Winston Chang
  affiliation: RStudio
  bio: |+
    Winston Chang is a software engineer at RStudio and currently works
    on Shiny and related projects. He has also worked on several other R
    packages, including devtools, R6, and ggplot2. Winston is the author
    of the R Graphics Cookbook, published by O'Reilly Media, and has a PhD
    in psychology from Northwestern University.

  photo: /assets/img/2022Conf/_talks/22232_winston-chang.jpeg
  url:
    webpage: ~
    twitter: https://twitter.com/winston_chang
    github: github.com/wch
    linkedin: ~
    affiliation: rstudio.com

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

You've probably heard that we're porting Shiny to Python. I want to talk about
one really cool new feature that PyShiny has: the ability to run Shiny apps
entirely in the browser. That means that Python isn't running on a remote server
-- instead, Python itself runs in the browser, using a version of Python that's
compiled to WebAssembly. This opens up many ways of using and deploying Shiny
applications. I'll demonstrate how to do this, and some of the new things that
it enables. I'll also talk about the limitations, because not every Shiny app
can be run this way.
