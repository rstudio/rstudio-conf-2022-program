---
# Do not edit
talk_id: 22181
talk_slug: highlights-of-knitr-package-past
talk_type: regular
talk_tags: [communication, programming]
session_slug: rmarkdown-quarto
sched_url: https://rstudioconf2022.sched.com/event/11iZK
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Highlights of the knitr package from the past two years"
# A short version of the title, suitable for small displays
talk_title_short: Highlights of the knitr package from the past two years
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Yihui Xie
  affiliation: RStudio, PBC
  url:
    webpage: https://yihui.org
    twitter: https://twitter.com/xieyihui
    github: https://github.com/yihui
    linkedin: ~
    affiliation: ~
  username: yihui_xie.1v84pjlj
  photo: /assets/img/2022Conf/_talks/22181_yihui-xie.png
  bio: |+
    Yihui Xie is a software engineer at RStudio. He earned his PhD from
    the Department of Statistics, Iowa State University. He has authored
    and co-authored several R packages, such as knitr, rmarkdown,
    bookdown, blogdown, and xaringan. He has published a number of books,
    including “Dynamic Documents with R and knitr”, “bookdown: Authoring
    Books and Technical Documents with R Markdown”, “blogdown: Creating
    Websites with R Markdown”, “R Markdown: The Definitive Guide”, and “R
    Markdown Cookbook.”


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

In this talk, I will highlight a few selected new features of the knitr package
introduced in the past two years including: 1) the new way to write chunk
options as "#|" comments in the chunk body; 2) new ways to reuse both chunk body
and chunk options from another code chunk; 3) a few useful new engines, namely
`comment` (comment out arbitrary content), `verbatim` (write arbitrary verbatim
content), `embed` (embed external files and display their content verbatim), and
`exec` (execute an arbitrary command); and 4) a few new chunk options such as
`file` (to include external files as the chunk body) and `lang`. Hopefully these
new features can help both knitr users and developers make better use of knitr.
