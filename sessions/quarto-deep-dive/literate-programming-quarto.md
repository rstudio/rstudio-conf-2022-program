---
# Do not edit
talk_id: 22142
talk_slug: literate-programming-quarto
talk_type: regular
talk_tags: [communication, interop, Quarto]
session_slug: quarto-deep-dive
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Literate Programming With Jupyter Notebooks and Quarto"
# A short version of the title, suitable for small displays
talk_title_short: Literate Programming With Quarto
# A link to your talk's materials, when ready
talk_materials_url: https://github.com/fastai/nbdev-demo
speakers:
- name: Hamel Husain
  affiliation: fastai
  url:
    webpage: https://hamel.dev
    twitter: https://twitter.com/HamelHusain
    github: https://github.com/hamelsmu
    linkedin: https://www.linkedin.com/in/hamelhusain/
    affiliation: https://github.com/fastai
  username: hamel.husain
  photo: /assets/img/2022Conf/_talks/22142_hamel-husain.jpg
  bio: |+
    Hamel Husain is head of Data Science and ML at
    [Outerbounds](https://outerbounds.com/) (the developers of
    [Metaflow](https://metaflow.org/)). Previous to Outerbounds, Hamel has built
    ML infrastructure and deployed data products at Airbnb, GitHub, and
    DataRobot. Hamel is also very active in open source communities and is
    currently a core contributor of [fastai](https://github.com/fastai), and is
    involved in projects such as Jupyter, Kubeflow,and Great Expectations.

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Jupyter Notebooks play a critical role in in the workflow of many users. Notebooks are used to document existing code, to quickly prototype and iterate on ideas, and as a medium of technical communication. However, package developers typically use an entirely separate set of more traditional development tools, and the context switching between these tools and notebooks can be frustrating. Not only do you lose the ability to iterate fast, but you lose the ability to document and test your code in-situ, requiring you to create documentation and tests separately from source code.

[Nbdev](https://github.com/fastai/nbdev) is a [literate programming framework](https://en.wikipedia.org/wiki/Literate_programming) that allows you to develop Python libraries within Jupyter Notebooks. In this talk, Hamel will describe the integration between Nbdev amd Quarto, which enables library developers to author their documentation right alongside their code, and automatically produce a Quarto website for their package. The result is a seamless workflow for developing, documenting, and testing software packages all within Jupyter Notebooks, with no context-switching required.


