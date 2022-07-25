---
# Do not edit
talk_id: 22196
talk_slug: comparing-package-versions-diffify
talk_type: lightning
talk_tags: [career-development, programming, shiny]
session_slug: lightning-talks
sched_url: https://rstudioconf2022.sched.com/event/11ia3
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Comparing package versions with Diffify"
# A short version of the title, suitable for small displays
talk_title_short: Comparing package versions with Diffify
# A link to your talk's materials, when ready
talk_materials_url: https://github.com/rstudio/rstudio-conf/blob/master/2022/colingillespie/2022-07-27_rstudio-conf%20-%20Colin%20Gillespie.pdf
speakers:
- name: Colin Gillespie
  affiliation: Jumping Rivers
  url:
    webpage: ~
    twitter: https://twitter.com/csgillespie
    github: https://github.com/csgillespie/
    linkedin: https://www.linkedin.com/in/colin-gillespie-25028332/
    affiliation: https://jumpingrivers.com/
  username: colinjumpingrivers.com
  photo: /assets/img/2022Conf/_talks/22196_colin-gillespie.jpg
  bio: |+
    Colin has been using R since 1999. He's the author of a number of R
    packages, the co-founder of Jumping Rivers and has published the book
    Efficient R Programming with O'Reilly.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Even when we run the simplest of R scripts, we are using dozens of R packages.
We use packages for data cleaning, writing reports, graphics and modelling. One
of the strengths of R, is the depth of packages.

Unfortunately, packages change and break our code. Not all R packages have NEWS
file, and even those that do, it might not be complete.

The diffify service aims to make comparing between package versions easier.
For example, is there a new Import? Or perhaps a package has been removed from
Suggests? Maybe the arguments of a function have changed? Or a function is no
longer exported. Diffify can help.

NB: We have completed the back-end infrastructure, and are currently working on
the front-end. Expected launch: ~May 1st
