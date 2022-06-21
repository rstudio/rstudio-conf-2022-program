---
# Do not edit
talk_id: 22175
talk_slug: sometimes-you-just-need-words
talk_type: regular
talk_tags: [communication, interop]
session_slug: rmarkdown-quarto
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Sometimes you just need words"
# A short version of the title, suitable for small displays
talk_title_short: Sometimes you just need words
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Lewis Kirvan
  affiliation: Consumer Financial Protection Bureau
  url:
    webpage: https://www.duck-rabbit-soup.com/
    twitter: ~
    github: https://lmkirvan.github.io/index.html
    linkedin: https://www.linkedin.com/in/lewis-kirvan-9013392b/
    affiliation: https://www.consumerfinance.gov/
  username: lewis_kirvan
  photo: /assets/img/2022Conf/_talks/22175_lewis-kirvan.jpg
  bio: |+
    I'm a researcher at the Consumer Financial Protection Bureau, where
    I've spent the last (nearly) 10 years recovering from getting a law
    degree. I mostly work to understand consumers experiences by listening
    to them at scale.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

This talk will trace the evolution of a report from a mostly text free dashboard
into a text heavy R markdown report with dynamic text blocks. The report in
question is provided to the largest financial institutions in the U.S., but the
audience for the data largely is composed of compliance experts and lawyers.

The interface between data products, and people who make decisions is often the
most difficult piece in a project. Frequently, what your audience really needs
is words! This talk will help you recognize when you need more narrative and
will provide some helpful technical advice to get you there, including how to
use existing word templates and how to use `whisker::` and `glue::` to help you
dynamically generate text.
