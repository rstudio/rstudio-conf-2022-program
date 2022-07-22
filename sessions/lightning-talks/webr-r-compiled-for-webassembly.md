---
# Do not edit
talk_id: 22027
talk_slug: webr-r-compiled-for-webassembly
talk_type: lightning
talk_tags: [programming,interop,tool]
session_slug: lightning-talks
sched_url: https://rstudioconf2022.sched.com/event/123PB
# ---- Edit information below this line ----
# The title of your talk
talk_title: "WebR: R compiled for WebAssembly and running in the browser"
# A short version of the title, suitable for small displays
talk_title_short:"WebR: R running in the browser"
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: George Stagg
  affiliation: RStudio
  url:
    webpage: https://www.gwstagg.co.uk
    twitter: https://twitter.com/gwstagg
    github: https://github.com/georgestagg
    linkedin: ~
    affiliation: ~
  username: george_stagg
  photo: /assets/img/2022Conf/_talks/22027_george-stagg.jpeg
  bio: |+
    George Stagg is a Software Engineer with experience in research
    computing and mathematical digital learning software. He holds a
    PhD in Applied Mathematics from Newcastle University, researching
    the physics of quantum fluids through high performance computer
    simulation. Until recently George worked as part of the E-learning
    Unit at Newcastle University, developing software, providing research
    support and teaching mathematical computing with R, Python, LaTeX and
    more. George is now lead developer for the webR project, aiming to
    compile R and its packages for WebAssembly.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

In this talk I introduce webR, a port of R to WebAssembly using Emscripten.
WebR brings a full R environment to the browser, enabling R code execution,
numerical analysis, loading packages and more. No local or cloud-based R
servers are required as all computation is performed within the browser.
I give a brief overview of our build process for webR, describing the toolchain
and some of the issues we encountered. A publicly available web-based R session
is demonstrated, with package and plotting support.
