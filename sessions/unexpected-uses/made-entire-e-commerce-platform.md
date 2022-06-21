---
# Do not edit
talk_id: 22065
talk_slug: made-entire-e-commerce-platform
talk_type: regular
talk_tags: [process, recreational, shiny, visualisation]
session_slug: unexpected-uses
# ---- Edit information below this line ----
# The title of your talk
talk_title: "I made an entire e-commerce platform on Shiny"
# A short version of the title, suitable for small displays
talk_title_short: I made an entire e-commerce platform on Shiny
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Jacqueline Nolis
  affiliation: Saturn Cloud
  url:
    webpage: https://jnolis.com
    twitter: https://github.com/jnolis/ggirl
    github: https://github.com/jnolis/ggirl
    linkedin: ~
    affiliation: ~
  username: jacqueline-nolis
  photo: /assets/img/2022Conf/_talks/22065_jacqueline-nolis.jpg
  bio: |+
    Dr. Jacqueline Nolis is a data science leader with 15 years of
    experience in running data science teams and projects at companies
    ranging from Airbnb to Boeing. She is the Chief Product Officer at
    Saturn Cloud where she helps design products for data scientists.
    Jacqueline R expertise includes deploying R into production systems
    and neural networks in R. For fun, Jacqueline likes to use data
    science for humor—like using deep learning to generate offensive
    license plates.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

E-commerce requires passing data between many components like managing a
shopping cart, taking payment, fulfilling orders, and sending emails. I've
successfully created a full e-commerce platform entirely in R for a quirky side
project. The R package ggirl lets users order ggplot2 plots as postcards and
more via R functions. Those R functions pass data to a separate Shiny app, which
then passes data other services like Stripe payment APIs and printing APIs. In
this talk I will walk through how to use packages like httr, callr, and brochure
to have your Shiny apps call external services and do many tasks in parallel.
You’ll leave the talk with more ways to use Shiny than dashboards plus the
knowledge to monetize your existing dashboards!
