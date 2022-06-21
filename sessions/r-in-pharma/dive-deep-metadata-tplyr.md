---
# Do not edit
talk_id: 22194
talk_slug: dive-deep-metadata-tplyr
talk_type: regular
talk_tags: [medicine, pharma, process, tool]
session_slug: r-in-pharma
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Dive Deep into Metadata with Tplyr"
# A short version of the title, suitable for small displays
talk_title_short: Dive Deep into Metadata with Tplyr
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Mike Stackhouse
  affiliation: Atorus Research
  url:
    webpage: https://www.atorusresearch.com/
    twitter: https://twitter.com/mike_at_atorus
    github: https://github.com/mstackhouse
    linkedin: https://www.linkedin.com/in/michael-s-stackhouse/
    affiliation: https://www.atorusresearch.com/
  username: mike_stackhouse
  photo: /assets/img/2022Conf/_talks/22194_mike-stackhouse.jpg
  bio: |+
    Mike Stackhouse is the Chief Innovation Officer of Atorus Research
    and leads Atorus’ Analytics Engineering department. Mike has a long
    history of experience in statistical programming with a heavy focus
    on process improvement, automation, and streamlining. This ultimately
    drove Mike into the use of open-source and programming in R and
    Python. It was his interest in open-source tooling which lead Mike to
    UC Berkeley, where in 2020 he graduated with a Master’s in Information
    and Data Science program.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Back in 2020, Atorus first released our package Tplyr. The aim of Tplyr was
to build a reusable framework that makes all the data preparation for clinical
reporting simple – and takes the hassle out of tedious things like decimal and
parentheses alignment. But from the beginning, Tplyr was always meant to be
more. Tplyr captures metadata about the table being built, and in Tplyr 1.0.0
we can leverage that metadata to its full advantage. Tplyr now let’s you dive
in, and for any result provides the traceability of how that result was derived,
and the data used to do-so. In our talk, we will explore this new functionality
built into Tplyr, the mechanics that make it work, and how these new features
are useful in the clinical world and beyond.
