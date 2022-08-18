---
# Do not edit
talk_id: 22232
talk_slug: running-shiny-without-server
talk_type: regular
talk_tags: [python, shiny, tool]
session_slug: python
sched_url: https://rstudioconf2022.sched.com/event/11iZr
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Running Shiny without a server"
# A short version of the title, suitable for small displays
talk_title_short: Running Shiny without a server
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Winston Chang
  affiliation: RStudio
  url:
    webpage: ~
    twitter: https://twitter.com/winston_chang
    github: https://github.com/wch
    linkedin: ~
    affiliation: https://rstudio.com
  username: winston_chang.1v84pjmr
  photo: /assets/img/2022Conf/_talks/22232_winston-chang.jpeg
  bio: |+
    Winston Chang is a software engineer at RStudio and currently works
    on Shiny and related projects. He has also worked on several other R
    packages, including devtools, R6, and ggplot2. Winston is the author
    of the R Graphics Cookbook, published by O'Reilly Media, and has a PhD
    in psychology from Northwestern University.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Shiny for Python has the ability to be deployed without a server that runs Python. These applications can be served by any web hosting service. They are easily deployed and can scale to handle large amounts of traffic.

This mode of deployment is called **Shinylive**. It works by running Python in the user’s web browser, using Pyodide, which is a version of Python that is compiled to WebAssembly. Shinylive opens up new possibilities for how Shiny applications can be used. In this talk I discuss the advantages and the limitations of Shinylive applications.
