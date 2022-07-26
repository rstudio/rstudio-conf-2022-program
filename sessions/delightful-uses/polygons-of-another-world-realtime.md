---
# Do not edit
talk_id: 22135
talk_slug: polygons-of-another-world-realtime
talk_type: regular
talk_tags: [recreational, tool, visualisation]
session_slug: delightful-uses
sched_url: https://rstudioconf2022.sched.com/event/11ibb
# ---- Edit information below this line ----
# The title of your talk
talk_title: "The Polygons of Another World - realtime interactive rendering in R"
# A short version of the title, suitable for small displays
talk_title_short: The Polygons of Another World - realtime interactive rendering in R
# A link to your talk's materials, when ready
talk_materials_url: https://github.com/coolbutuseless/RStudioConf-2022
speakers:
- name: Mike Cheng
  affiliation: ~
  url:
    webpage: https://www.coolbutuseless.com
    twitter: https://twitter.com/coolbutuseless
    github: https://github.com/coolbutuseless
    linkedin: https://www.linkedin.com/in/michael-cheng-8782632b
    affiliation: ~
  username: mike_cheng
  photo: /assets/img/2022Conf/_talks/22135_mike-cheng.png
  bio: |+
    I code in R in pharma for living.  I enjoy exploring the limits of R.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

In this talk I want to explore R's capabilities for fast, interactive graphical applications.  This exploration is driven by my ongoing port of the 1991 action adventure game "Another World", but these capabilities also open up possibilities for new visualisations and applications in R.

The porting of this game is a 'moonshot' project as I try to discover the techniques and tools needed for fast (>20fps) interactive (keyboard + mouse) rendering to R graphics devices. A further constraint is that I want all this to be done in plain R - avoiding any C or javascript as much as possible.

I will discuss three of the key challenges faced: graphics device speed, fast double-buffered rendering and event-driven programming for interactivity.   

I will showcase the capability of R to render 5000 moving sprites using the `nara` package, an interactive drum machine with the `eventloop` package, and my progress with the 'Another World' game engine with animation, keyboard control and synchronised sound.
