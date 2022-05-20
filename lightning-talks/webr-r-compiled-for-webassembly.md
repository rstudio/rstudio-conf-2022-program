---
# Do not edit
talk_id: 22027
talk_slug: webr-r-compiled-for-webassembly
talk_type: lightning
session_slug: lightning-talks
block: 4-4-session
# ---- Edit information below this line ----
# The title of your talk
talk_title: WebR: R compiled for WebAssembly and running in the browser
# A short version of the title, suitable for small displays
talk_title_short: WebR
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: George Stagg
  affiliation: RStudio
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

  photo: /assets/img/2022Conf/_talks/22027_george-stagg.jpeg
  url:
    webpage: https://www.gwstagg.co.uk
    twitter: https://twitter.com/Tegglington
    github: https://github.com/georgestagg
    linkedin: ~
    affiliation: ~

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

In this talk we introduce webR, a port of R to WebAssembly using Emscripten.
WebR brings a full R environment to the browser, enabling R code execution,
numerical analysis, loading packages and more. No local or cloud-based R
execution severs are required as all computation is performed client-side. We
give an overview of our build process for webR, describing the toolchain and
various issues we encountered modifying R for the WebAssembly environment. Two
publicly available use cases are demonstrated; firstly a web-based interactive
R REPL, with R package and plotting support. Secondly, and also our primary goal
for the project: automatically assessing learner-submitted R and Python code
using our digital exam software, Numbas.
