---
# Do not edit
talk_id: 22214
talk_slug: dbcooper-turn-database-r-python
talk_type: regular
talk_tags: [databases, interop, process, tool]
session_slug: databases
# ---- Edit information below this line ----
# The title of your talk
talk_title: "dbcooper: Turn any database into an R or Python package"
# A short version of the title, suitable for small displays
talk_title_short: dbcooper
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: David Robinson
  affiliation: Heap Analytics
  url:
    webpage: http://varianceexplained.org/
    twitter: https://twitter.com/drob
    github: https://github.com/dgrtwo
    linkedin: https://www.linkedin.com/in/david-robinson-3584642a
    affiliation: https://heap.io/
  username: david_robinson
  photo: /assets/img/2022Conf/_talks/22214_david-robinson.jpg
  bio: |+
    David Robinson is Director of Data Science at Heap Analytics, where
    he's helping to build the next generation of product analytics
    technology. He's the co-author with Julia Silge of the tidytext
    package and the O’Reilly book Text Mining with R. He also created
    the broom, fuzzyjoin, and widyr packages, and authored the e-
    book Introduction to Empirical Bayes. David is passionate about R,
    statistics, education, live-coding, probability, and his two children.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

The first step of any data analysis is importing data, but for tables in a
database this can be a surprisingly challenging step that takes analysts out
of their workflow. The dbcooper package turns a database connection into a
collection of accessor functions, letting users take advantage of autocomplete
as they browse a database in the same ways they would engage with local tables.
I'll walk through how dbcooper can be used to build a database-specific package,
whether for an organization's internal use or to wrap a public data source. The
dbcooper package supports both R (built on top of dbplyr) and Python (built on
top of siuba), and in either language makes it easy and intuitive to extract
insights from a database.
