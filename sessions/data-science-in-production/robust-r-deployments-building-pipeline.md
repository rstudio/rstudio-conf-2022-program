---
# Do not edit
talk_id: 22198
talk_slug: robust-r-deployments-building-pipeline
talk_type: regular
talk_tags: [html/css/js, interop, production]
session_slug: data-science-in-production
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Robust R Deployments: Building a Pipeline from RStudio to Production"
# A short version of the title, suitable for small displays
talk_title_short: Robust R Deployments
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: David Maguire
  affiliation: dv01
  url:
    webpage: ~
    twitter: ~
    github: https://github.com/davemaguire
    linkedin: https://www.linkedin.com/in/david-maguire-30636956/
    affiliation: https://www.dv01.co/offerings/tape-cracker/
  slug: david-maguire
  photo: /assets/img/2022Conf/_talks/22198_david-maguire.jpg
  bio: |+
    A physical scientist by training, David leverages the scientific
    method along with the statistical capabilities of R to solve business
    issues. He has applied this skillset to a variety of industries,
    including pharmaceutical manufacturing and, currently, structured
    finance at dv01. After witnessing non-robust deployments prevent
    excellent models from creating value, David focused on creating robust
    and scalable model pipelines in the cloud. At his current position
    at dv01, David manages a customer facing plumber API. This API is the
    entry point to one of dv01's top products, Tape Cracker.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

R is often maligned as a poor fit for production deployment systems. At dv01 we
deploy Plumber API that serves machine learning models to Tape Cracker, a client
facing web application. With R in production we use the same codebase throughout
the data science pipeline, saving time and resources while reducing the chance
for bugs in the hand-off. To accomplish this we use industry standard continuous
integration and deployment tools to deploy our API to compute clusters in the
cloud. Our pipeline progresses stepwise through staging, release and production
environments. Automated integration testing at each step enables a robust and
reliable deployment. In this talk R users will learn strategies to deploy R code
in production environments.
