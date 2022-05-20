---
# Do not edit
talk_id: 22115
talk_slug: shinytest2-unit-testing-for-shiny
talk_type: regular
session_slug: big-shiny-apps
block: 4-8-session
# ---- Edit information below this line ----
# The title of your talk
talk_title: {shinytest2}: Unit testing for Shiny applications
# A short version of the title, suitable for small displays
talk_title_short: {shinytest2}
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Barret Schloerke
  affiliation: RStudio
  bio: |+
    `hello()`! Dr. Barret Schloerke is a Shiny Software Engineer
    at RStudio. He currently maintains and creates many R packages
    surrounding the Shiny ecosystem, including `{shiny}`, `{shinytest2}`,
    `{reactlog}`, and `{plumber}`.

  photo: /assets/img/2022conf/_talks/22115_barret-schloerke.png
  url:
    webpage: http://schloerke.com/
    twitter: https://twitter.com/schloerke
    github: https://github.com/schloerke
    linkedin: https://www.linkedin.com/in/schloerke/
    affiliation: https://www.rstudio.com/

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Manually testing Shiny applications is often laborious, inconsistent, and
doesn’t scale well. Whether you are developing new features, fixing bug(s),
or simply upgrading dependencies, it is critical to know when regressions are
introduced. The new {shinytest2} R package provides a toolkit for unit testing
Shiny apps and seamlessly integrates with {testthat}. Under the hood, it uses
the new {chromote} R package to render apps in a headless Chrome browser with
features such as live preview and built in debugging tools. In this talk,
you’ll learn how to test Shiny apps by simply recording your actions as code
and extending it to test more particular aspects of your app, resulting in fewer
bugs and more confidence in future development.
