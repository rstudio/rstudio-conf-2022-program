---
# Do not edit
talk_id: 22228
talk_slug: visualizing-distributions-uncertainty-using-ggdist
talk_type: lightning
talk_tags: [modeling, tool, visualisation]
session_slug: lightning-talks
sched_url: https://rstudioconf2022.sched.com/event/11iaS
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Visualizing distributions and uncertainty using ggdist"
# A short version of the title, suitable for small displays
talk_title_short: Visualizing distributions and uncertainty using ggdist
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Matthew Kay
  affiliation: Northwestern University
  url:
    webpage: https://www.mjskay.com/
    twitter: https://twitter.com/mjskay
    github: https://github.com/mjskay
    linkedin: ~
    affiliation: https://www.northwestern.edu/
  username: mjskay
  photo: /assets/img/2022Conf/_talks/22228_matthew-kay.jpg
  bio: |+
    Matthew Kay is an Assistant Professor jointly appointed in Computer
    Science and Communications Studies at Northwestern University. He
    works in human-computer interaction and information visualization,
    including uncertainty visualization and the design of human-
    centered tools for data analysis. He co-directs the [Midwest
    Uncertainty Collective](http://mucollective.co) and is the author
    of the [tidybayes](https://mjskay.github.io/tidybayes/) and [ggdist]
    (https://mjskay.github.io/ggdist/) R packages for visualizing Bayesian
    statistical model output and uncertainty.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

I propose a talk on visualizing distributions and uncertainty using {ggdist}.
I will describe how to think systematically about distributional visualization
as mappings of PDFs, CDFs, and quantile functions onto aesthetics, and how
support for this enables creative and easy exploration of the space of possible
uncertainty visualizations. I will highlight features like true gradient support
in R 4.1, support for distribution vector datatypes, and the automatic binwidth-
selecting geom_dots(). I expect to leave the audience with: (1) a systemic
way to think about visualizing distributions and uncertainty in the grammar of
graphics and (2) an understanding of how to actually do it using ggdist.
