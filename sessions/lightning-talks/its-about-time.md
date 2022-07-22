---
# Do not edit
talk_id: 22028
talk_slug: its-about-time
talk_type: lightning
talk_tags: [programming, tool]
session_slug: lightning-talks
sched_url: https://rstudioconf2022.sched.com/event/11iZu
# ---- Edit information below this line ----
# The title of your talk
talk_title: "It's about time"
# A short version of the title, suitable for small displays
talk_title_short: It's about time
# A link to your talk's materials, when ready
talk_materials_url: https://speakerdeck.com/davisvaughan/2022-rstudio-conf-its-about-time
speakers:
- name: Davis Vaughan
  affiliation: RStudio
  url:
    webpage: https://blog.davisvaughan.com
    twitter: https://twitter.com/dvaughan32
    github: https://github.com/DavisVaughan
    linkedin: ~
    affiliation: ~
  username: davis_vaughan
  photo: /assets/img/2022Conf/_talks/22028_davis-vaughan.jpg
  bio: |+
    Davis is a software engineer at RStudio working on improving the
    tidyverse and tidymodels ecosystems. He works on packages such as
    tidyr, vctrs, furrr, slider, clock, hardhat, and yardstick.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Dealing with date-times is hard. Dealing with date-times without the proper
tooling is even harder! clock is an R package that aims to provide comprehensive
and safe handling of date-times. It goes beyond the date and date-time types
that base R provides, implementing new types for year-month, year-quarter, ISO
year-week, and many other date-like formats, all with up to nanosecond
precision. In this talk, you'll see how clock emphasizes "safety first" when
manipulating date-times, and how these new date-time types can be used in your
own work.
