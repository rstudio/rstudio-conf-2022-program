---
# Do not edit
talk_id: 22233
talk_slug: future-of-missing-data
talk_type: lightning
talk_tags: [tool]
session_slug: lightning-talks
sched_url: https://rstudioconf2022.sched.com/event/11ia4
# ---- Edit information below this line ----
# The title of your talk
talk_title: "The Future of missing data"
# A short version of the title, suitable for small displays
talk_title_short: The Future of missing data
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Nicholas Tierney
  affiliation: Telethon Kids Institute, Perth, Australia
  url:
    webpage: https://njtierney.com/
    twitter: https://twitter.com/nj_tierney
    github: https://github.com/njtierney
    linkedin: https://www.linkedin.com/in/nj-tierney/
    affiliation: https://www.telethonkids.org.au/our-research/brain-and-behaviour/population-health-program/geospatial-health-and-development/
  username: nicholas_tierney
  photo: /assets/img/2022Conf/_talks/22233_nicholas-tierney.jpeg
  bio: |+
    Nick Tierney has an honours degree in Psychology, and a PhD in
    Statistics and now work as a research software engineer with
    [Nick Golding](https://www.telethonkids.org.au/contact-us/our-
    people/g/nick-golding/) at the [Telethon Kids Institute](https://
    www.telethonkids.org.au/), in Perth. Here, he maintains the [greta]
    (https://greta-stats.org/) R package for statistical modelling,
    and writes new software to perform analysis on diseases like
    COVID19 and malaria. Previously, Nick worked at Monash University,
    working with [Di Cook](http://dicook.org/), teaching [ETC1010,
    introduction to Data Analysis](https://dmac.netlify.org/), and
    developing the following R packages for exploratory data analysis:
    ([`visdat`](https://github.com/njtierney/visdat)) , [`naniar`]
    (https://naniar.njtierney.com/), and [`brolgar`](https://
    brolgar.njtierney.com/). Nick is a keen outdoorsman, and likes to hike
    really far, run ultra marathons, brew coffee, take photographs, and
    have long meandering conversations.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

If you do data analysis, you encounter missing data. Missing data upsets data
analysis workflow because you have to make decisions on how to deal with it -
do you impute the values? Remove them? These each have consequences! The data we
often encounter does not always arrive with a research question in mind, so how
do you understand why you have missing values? When I first encountered missing
data I was incredibly frustrated at how hard it was to understand and explore
it. This frustration led me to create two R packages to explore missing data,
{naniar} and {visdat}. In this talk I will showcase how to use these tools to
explore missing data, as well as new features that have not been presented, and
planned advances.
