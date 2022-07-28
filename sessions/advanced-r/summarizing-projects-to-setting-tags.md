---
# Do not edit
talk_id: 22103
talk_slug: summarizing-projects-to-setting-tags
talk_type: regular
talk_tags: [programming, recreational, tool]
session_slug: advanced-r
sched_url: https://rstudioconf2022.sched.com/event/11ibc
# ---- Edit information below this line ----
# The title of your talk
talk_title: "From summarizing projects to setting tags, uses of parsing R files"
# A short version of the title, suitable for small displays
talk_title_short: From summarizing projects to setting tags, uses of parsing R files
# A link to your talk's materials, when ready
talk_materials_url: https://github.com/brshallo/funspotr-rstudioconf2022
speakers:
- name: Bryan Shalloway
  affiliation: NetApp
  url:
    webpage: https://www.bryanshalloway.com/
    twitter: https://twitter.com/brshallo
    github: https://github.com/brshallo
    linkedin: https://www.linkedin.com/in/bryanshalloway
    affiliation: https://www.netapp.com/
  username: brshallo
  photo: /assets/img/2022Conf/_talks/22103_bryan-shalloway.jpg
  bio: |+
    Bryan is a Data Scientist at NetApp where he has worked on a
    wide range of internal operations problems in Customer Support,
    Forecasting, and Pricing Optimization. He also leads internal
    study groups on books like *Feature Engineering and Selection* and
    *Interpretable Machine Learning*. His writing on data science topics
    can be found at bryanshalloway.com. Bryan previously worked as a
    school analyst in Colorado and as a high school math teacher in North
    Carolina. He holds a Master's in Advanced Analytics from NC State and
    studied Cognitive Neuroscience at Washington University in St. Louis.
    Bryan lives in Seattle and in his spare time can be found reading the
    newsletters of various public policy wonks or listening to podcasts
    while cooking, cleaning, running, ...{insert any activity}.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

I'll walk through a few potential uses of parsing out the functions and packages in projects. 

* Creating a reference table: With so many #rstats learning materials out there, it's often helpful to parse-out the functions from a project and create a lookup table that complements your notes.  
* Analyzing files: A network visualization of the packages may provide insights as to which files or projects are most related to one another as well as which packages are most central to a body of work.  
* Setting tags: Picking good consistent tags for your blogdown website is hard. It's easier to just parse out the packages in each post and use those to organize your website.  

Examples will use helpers from the new {funspotr} package: https://github.com/brshallo/funspotr/
