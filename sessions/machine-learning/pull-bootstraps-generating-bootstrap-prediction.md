---
# Do not edit
talk_id: 22033
talk_slug: pull-bootstraps-generating-bootstrap-prediction
talk_type: regular
talk_tags: [modeling, tool]
session_slug: machine-learning
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Introducing workboots: Generate prediction intervals from tidymodel workflows"
# A short version of the title, suitable for small displays
talk_title_short: Introducing workboots
# A link to your talk's materials, when ready
talk_materials_url: https://github.com/markjrieke/rstudio-conf-2022
speakers:
- name: Mark Rieke
  affiliation: Memorial Hermann Health System
  url:
    webpage: https://www.thedatadiary.net/about/
    twitter: https://twitter.com/markjrieke
    github: https://github.com/markjrieke
    linkedin: https://www.linkedin.com/in/mark-j-rieke-ab4b0ab4/
    affiliation: https://www.memorialhermann.org/
  username: mark_rieke
  photo: /assets/img/2022Conf/_talks/22033_mark-rieke.png
  bio: |+
    I am a senior consumer experience (CX) analyst at Memorial Hermann
    Health System where I use R and tidymodels to provide actionable
    insights from patient satisfaction survey data. I love making
    beautiful charts, working on home improvement projects, and playing
    jazzy piano. I live in Houston, TX, with my fiancé and two obnoxious
    yet lovable pets.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Sometimes, we want a model that generates a range of possible outcomes around
each prediction. Other times, we just care about point predictions and may
opt to use a fancy model like XGBoost. But what if we want the best of both
worlds: getting a range of predictions while still using a fancy model? That’s
where bootstrapping comes to the rescue! By using bootstrap resampling, we can
create many models that produce a prediction distribution – regardless of the
model type! In this talk, I’ll give an overview of bootstrap resampling for
prediction, the pros/cons of this method, and how to implement it as a part of a
tidymodel workflow with the workboots package.
