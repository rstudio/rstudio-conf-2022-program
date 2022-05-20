---
# Do not edit
talk_id: 22058
talk_slug: new-way-to-build-shiny
talk_type: regular
session_slug: shiny-app-design
block: 4-6-session
# ---- Edit information below this line ----
# The title of your talk
talk_title: A new way to build your Shiny app's UI
# A short version of the title, suitable for small displays
talk_title_short: A new way to build your Shiny app's UI
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Nick Strayer
  affiliation: RStudio
  bio: |+
    Nick is an engineer on the Shiny team working to make web applications
    with R easy to build, beautiful, and powerful. Nick has a Ph.D. in
    Biostatistics from Vanderbilt University and previously worked as a
    data journalist at the New York Times.

  photo: /assets/img/2022conf/_talks/22058_nick-strayer.jpg
  url:
    webpage: nickstrayer.me
    twitter: https://twitter.com/NicholasStrayer
    github: https://github.com/nstrayer
    linkedin: https://www.linkedin.com/in/nickstrayer/
    affiliation: https://shiny.rstudio.com/

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Shiny helps data scientists create web applications without requiring web
development experience. However, there's still a steep learning curve for
writing the Ui portion of an app. Unlike an app's server code, which typically
only uses a few different Shiny-specific functions, the app's UI code is almost
entirely made up of alien functions with strange syntaxes and often surprising
interactions with each other. This paradigm requires a very different mindset
than your typical R Script. This talk will introduce the Shiny Visual Editor, a
drag-and-drop interface for building Shiny app UIs. I will show how the visual
editor can help you create non-trivial and beautiful apps without needing to
understand the difference between divs and spans.