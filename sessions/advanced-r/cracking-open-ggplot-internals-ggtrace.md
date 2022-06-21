---
# Do not edit
talk_id: 22100
talk_slug: cracking-open-ggplot-internals-ggtrace
talk_type: regular
talk_tags: [programming, tool, visualisation]
session_slug: advanced-r
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Cracking open ggplot internals with {ggtrace}"
# A short version of the title, suitable for small displays
talk_title_short: Cracking open ggplot internals with {ggtrace}
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: June Choe
  affiliation: University of Pennsylvania
  url:
    webpage: https://yjunechoe.github.io
    twitter: https://twitter.com/yjunechoe
    github: https://github.com/yjunechoe/ggtrace
    linkedin: ~
    affiliation: ~
  username: june-choe
  photo: /assets/img/2022Conf/_talks/22100_june-choe.jpg
  bio: |+
    June is a second year Ph.D. student in linguistics at the University
    of Pennsylvania, studying various topics in language acquisition and
    human sentence processing. He uses R extensively for experimental
    and corpus research, and spends too much time making the perfect
    figures for his papers. Outside of research, June spends his free time
    pursuing his hobby in data visualization, reading about its design
    principles and code-based implementations. June is also passionate
    about data science education, and his most recent side project tackles
    the knowledge gap between users and developers of ggplot. June takes
    breaks from his computer by cooking, ice skating, and hanging out with
    friends.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

The inner workings of {ggplot2} are difficult to grasp even for experienced
users because its internal object-oriented (ggproto) system is hidden from user-
facing functions, by design. This is exacerbated by the foreignness of ggproto
itself, which remains the largest hurdle in the user-to-developer transition.
However this needs not to be the case: ggplot internals have clear parallels to
data wrangling, where data is passed between methods that take inputs and return
outputs. Capitalizing on this connection, package {ggtrace} exposes the familiar
functional programming logic of ggplot with functions that inspect, capture, or
modify steps in a ggplot object's execution pipeline, enabling users to learn
the internals through trial-and-error.
