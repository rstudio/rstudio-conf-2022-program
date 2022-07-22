---
# Do not edit
talk_id: 22047
talk_slug: teaching-bilingual-classes-tidymodels-scikit
talk_type: regular
talk_tags: [interop, python, teaching]
session_slug: teaching-data-science
sched_url: https://rstudioconf2022.sched.com/event/11iYN
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Translating from {tidymodels} and scikit-learn: Lessons from a 'bilingual' course."
# A short version of the title, suitable for small displays
talk_title_short: Translating from {tidymodels} and scikit-learn
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Kelly Bodwin
  affiliation: California Polytechnic State University
  url:
    webpage: https://www.kelly-bodwin.com
    twitter: https://twitter.com/kellybodwin
    github: https://github.com/kbodwin
    linkedin: ~
    affiliation: statistics.calpoly.edu
  username: kelly_bodwin
  photo: /assets/img/2022Conf/_talks/22047_kelly-bodwin.jpg
  bio: |+
    Kelly Bodwin is an Assistant Professor of Statistics and Data
    Science and an RStudio Certified Instructor. She is passionate about
    developing R tools (especially choosing names for packages) and
    about creating innovative ways to teach computing to data scientists.
    Although her love for R is eternal and unwavering, she is currently
    begrudgingly allowing a little python into her heart.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

The friendly competition between R and python has gifted us with two stellar
packages for workflow-style predictive modeling: tidymodels in R, and scikit-
learn in python. When I had to choose between them for a Machine Learning 
Course, I said: ¿Porque no los dos? (Why not both?)

In this talk, I will share how the differences in structure and syntax 
between tidymodels and scikit-learn impacted student understanding. Can a
helper function hide an important decision about tuning parameters?  Can a
slight change in argument input influence the way we describe a model? The 
answer is a resounding, "¡Sí!" 

Don't despair, though, because I will also provide advice for avoiding 
pitfalls when switching between languages or implementations. Together, 
let's think about the power that programming choices has to shape the 
mental model of the user, and the ways that we can responsibly document
our modeling decisions to increase cross-language reproducibility.
