---
# Do not edit
talk_id: 22014
talk_slug: exploratory-spatial-data-analysis
talk_type: lightning
talk_tags: [spatial, tidyverse, tool]
session_slug: lightning-talks
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Exploratory Spatial Data Analysis in the tidyverse"
# A short version of the title, suitable for small displays
talk_title_short: Exploratory Spatial Data Analysis in the tidyverse
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Josiah Parry
  affiliation: The NPD Group
  url:
    webpage: https://josiahparry.com/
    twitter: https://twitter.com/josiahParry/
    github: https://github.com/josiahparry
    linkedin: https://www.linkedin.com/in/josiahparry/
    affiliation: https://www.npd.com/
  slug: josiah-parry
  photo: /assets/img/2022Conf/_talks/22014_josiah-parry.jpg
  bio: |+
    Josiah Parry is a Research Analyst in the Research Science division
    at The NPD Group focusing on modernization and methodology. Formerly
    he worked at RStudio, PBC on the customer success team enabling public
    sector adoption of data science tools. Josiah received his master's
    degree in Urban Informatics from Northeastern University. Prior to
    that, he earned his bachelor's degree in sociology with focuses in
    geographic information systems and general mathematics from Plymouth
    State University.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

R has come quite a long way to enable spatial analysis over the past few years.
Packages such as sf have made spatial analysis and mapping easier for many.
However, adoption of R for spatial statistics and econometrics has been limited.
Many spatial analysts, researchers, and practitioners lean on Python libraries
such as pysal.

In this talk I briefly discuss my journey through spatial analysis and introduce
a new package sfdep which provides a tidy interface to spatial statistics and
noteably exploratory spatial data analysis. sfdep is an interface to the spdep
package as well as implements other common exploratory spatial statistics.
