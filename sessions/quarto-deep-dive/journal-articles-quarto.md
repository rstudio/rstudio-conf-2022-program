---
# Do not edit
talk_id: 22142
talk_slug: literate-programming-quarto
talk_type: regular
talk_tags: [communication, interop]
session_slug: quarto-deep-dive
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Literate Programming With Jupyter Notebooks and Quarto"
# A short version of the title, suitable for small displays
talk_title_short: Literate Programming With Quarto
# A link to your talk's materials, when ready
talk_materials_url: https://github.com/fastai/nbdev-demo
- name: Hamel Husain
  affiliation: fastai
  url:
    webpage: https://hamel.dev  
    twitter: https://twitter.com/HamelHusain
    github: https://github.com/hamelsmu
    linkedin: https://www.linkedin.com/in/hamelhusain/
    affiliation: https://github.com/fastai
  slug: nbdev-quarto
  photo: https://github.com/hamelsmu.png
  bio: |+
    Hamel Husain is head of Data Science and ML at [Outerbounds](https://outerbounds.com/). Previous to Outerbounds, Hamel has built ML infrastructure and deployed data products at Airbnb, GitHub, and DataRobot. Hamel is also very active in open source communities and is currently a core contributor of [fastai](https://github.com/fastai), and is involved in projects such as Jupyter, Kubeflow,and Great Expectations.

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Tools like RMarkdown, Quarto and Jupyter Notebooks have long been a central part of our workflow. We use these tools at critical junctures: To document existing code, to quickly protoptype and iterate on ideas with software, and as a medium of technical communication. The context switching between these tools and traditional software develepoment approaches can be frustrating. Not only do you lose the ability to iterate fast, but you lose the ability to document and test your code in-situ requring you to create documentation and tests seperately from source code.  

[nbdev](https://github.com/fastai/nbdev) is a [literate programming framework](https://en.wikipedia.org/wiki/Literate_programming) that allows you to develop Python libraries within Jupyter Notebooks, putting all your code, tests and documentation in one place. nbdev prvides a highly productive way of programming while encouraging software development best practices. In this talk, Hamel will demonstrate integration between Quarto and nbdev, enabling the use of a common set of tools to not only write documentation, websites and blogs, but also test and distribute software packages in a development workflow without context-switching. 

