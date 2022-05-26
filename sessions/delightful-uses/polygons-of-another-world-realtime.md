---
# Do not edit
talk_id: 22135
talk_slug: polygons-of-another-world-realtime
talk_type: regular
talk_tags: [recreational, tool, visualisation]
session_slug: delightful-uses
# ---- Edit information below this line ----
# The title of your talk
talk_title: "The Polygons of Another World - realtime interactive rendering in R"
# A short version of the title, suitable for small displays
talk_title_short: The Polygons of Another World - realtime interactive rendering in R
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Mike Cheng
  affiliation: ~
  url:
    webpage: https://www.coolbutuseless.com
    twitter: https://twitter.com/coolbutuseless
    github: https://github.com/coolbutuseless
    linkedin: https://www.linkedin.com/in/michael-cheng-8782632b
    affiliation: ~
  slug: mike-cheng
  photo: /assets/img/2022Conf/_talks/22135_mike-cheng.png
  bio: |+
    TBD. Will write this when I get the chance


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

In this talk I want to discuss my R port of the 1991 action adventure game
"Another World".

The porting of this game is a 'moonshot' project as I try to discover/write the
techniques/tools needed for realtime (>20fps) interactive (keyboard + mouse)
rendering to R graphics devices. A further constraint is that I want all this to
be done in plain R - avoiding any C or javascript as much as possible.

I will discuss the many challenges I faced: event programming, graphics device
speed, sound rendering, virtual machine implementation, translation of C to R,
etc.

I will also highlight some of the changes needed to the R graphics device
framework to help make realtime interactive applications more common and easier
to develop.
