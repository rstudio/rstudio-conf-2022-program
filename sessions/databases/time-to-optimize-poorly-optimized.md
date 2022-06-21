---
# Do not edit
talk_id: 22007
talk_slug: time-to-optimize-poorly-optimized
talk_type: regular
talk_tags: [communication, databases, story]
session_slug: databases
# ---- Edit information below this line ----
# The title of your talk
talk_title: "No Time to Optimize: A Poorly Optimized Query Story"
# A short version of the title, suitable for small displays
talk_title_short: No Time to Optimize
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Rebecca Hadi
  affiliation: Lyn Health
  url:
    webpage: https://www.rebeccahadi.dev
    twitter: https://twitter.com/beehadi26
    github: https://github.com/bhadi26
    linkedin: https://www.linkedin.com/in/rebeccahadi/
    affiliation: https://lynhealth.io
  username: rebecca_hadi
  photo: /assets/img/2022Conf/_talks/22007_rebecca-hadi.jpg
  bio: |+
    Rebecca Hadi is the Head of Data Science at Lyn Health. She holds a
    Master's degree in Applied and Computational Mathematics from Johns
    Hopkins University and a Bachelor's degree in Mathematics from the
    University of Washington. Rebecca loves automating and optimizing
    processes, building Shiny apps, and helping others learn to code.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

When I first starting working with clickstream data, I brought down the entire
data warehouse overnight and delayed business critical reporting...and it turned
out to be one of the best learning experiences of my career! In this talk, I
provide the context for the cluster-killing query + what I did wrong, describe
the business impact, how the query runtime was reduced from 7+ hours to <1 hour,
and how I came out the other side with a strong relationship with the DBA that
allowed me to be a bridge between engineering + data science organizations, set
aside my embarrassment and built some serious optimization skills, and shared my
learnings back with my team so they avoided my mistake.
