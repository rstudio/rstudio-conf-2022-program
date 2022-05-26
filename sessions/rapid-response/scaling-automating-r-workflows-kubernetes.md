---
# Do not edit
talk_id: 22199
talk_slug: scaling-automating-r-workflows-kubernetes
talk_type: regular
talk_tags: [interop, production]
session_slug: rapid-response
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Scaling and automating R workflows with Kubernetes and Airflow"
# A short version of the title, suitable for small displays
talk_title_short: Scaling and automating R workflows with Kubernetes and Airflow
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Isaac Florence
  affiliation: UK Health Security Agency
  url:
    webpage: https://isaacflorence.co.uk/
    twitter: https://twitter.com/isaacatflorence
    github: https://github.com/isaac-florence
    linkedin: https://uk.linkedin.com/in/isaacflorence
    affiliation: https://www.gov.uk/government/organisations/uk-health-security-agency
  slug: isaac-florence
  photo: /assets/img/2022Conf/_talks/22199_isaac-florence.jpg
  bio: |+
    I am an epidemiologist and public health policy professional working
    for the UK Health Security Agency (UKHSA). I have been using R and
    RStudio products since university and both have formed a major part
    of my career so far. At UKHSA I write in - and teach - R, SQL, Python,
    and other programming and computing skills. Although currently much of
    my work is geared towards data engineering and infrastructure (for R,
    computing & data platforms, and team building), my favourite part of
    work is epidemiology analysis (in R!). I also work on R infrastructure
    for "Applied Epi" (the team behind the "Epidemiologists' R Handbook"),
    as well as on some soon-to-be-announced open source projects on
    scaling and containerising R workloads.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

During the pandemic, epidemiologists have been forced to adapt to the
unprecedented scale of the data and high cadence of reporting.

At the UK Health Security Agency, we have created a platform for teams to easily
deploy R and/or Python tasks onto our High-Performance Computing resources,
scheduling their execution, and allowing previously unthinkable workloads to
be executed with ease. Thanks to Kubernetes, git, Docker, and Airflow, our
epidemiologists can stop worrying about their laptop's memory and bandwidth, and
focus on answering the crucial questions of the pandemic. We'd like to tell you
how we did it.
