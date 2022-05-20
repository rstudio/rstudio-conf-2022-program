---
# Do not edit
talk_id: 22028
talk_slug: its-about-time
talk_type: lightning
session_slug: lightning-talks
block: 4-4-session
# ---- Edit information below this line ----
# The title of your talk
talk_title: It's About Time
# A short version of the title, suitable for small displays
talk_title_short: It's About Time
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Davis Vaughan
  affiliation: RStudio
  bio: |+
    Davis is a software engineer at RStudio working on improving the
    tidyverse and tidymodels ecosystems. He works on packages such as
    tidyr, vctrs, furrr, slider, clock, hardhat, and yardstick.

  photo: /assets/img/2022Conf/_talks/22028_davis-vaughan.jpg
  url:
    webpage: https://blog.davisvaughan.com
    twitter: https://twitter.com/dvaughan32
    github: https://github.com/DavisVaughan
    linkedin: ~
    affiliation: ~

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Dealing with date-times is hard. Dealing with date-times without the proper
tooling is even harder! clock is an R package that aims to provide comprehensive
handling of date-times. It goes beyond the date and date-time types that base
R provides, implementing new types for year-month, year-quarter, ISO year-week,
and many other date-like formats, all with up to nanosecond precision. In this
talk, you'll see practical applications of each of the new types that clock
provides in addition to cross-package examples using the tidyverse, slider (for
sliding windows), and iv (for intervals of date-times). Along the way, you'll
also learn about some of the craziest time zone oddities that I've encountered
while building the package!
