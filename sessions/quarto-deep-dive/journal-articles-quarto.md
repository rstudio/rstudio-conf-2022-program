---
# Do not edit
talk_id: 22142
talk_slug: literate-programming-quarto
talk_type: regular
talk_tags: [communication, interop]
session_slug: quarto-deep-dive
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Literate Programming With Quarto: A new way to write, distribute, test and document your software that will blow your mind."
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
    Hamel Husain is head of Data Science and ML at [Outerbounds](https://outerbounds.com/). Previous to Outerbounds, Hamel has built ML infrastructure and deployed data products at Airbnb, GitHub, and DataRobot. Hamel is also very active in open source communities and is currently a core contributor of [fastai](https://github.com/fastai), and is involved in projects such as Jupyter, Kubeflow,and Great Expectations with a focus on developing infrastructure and developer tools for data scientists. Prior to his stint in tech companies, Hamel was a consultant for 10 years where he deployed ML and data solutions across various industries. Hamel is also an angel investor and advisor to many ML and Data tooling companies.

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

Tools like RMarkdown, Quarto and Jupyter Notebooks have long been a central part of our workflow.  We use these tools in critical junctures: To document existing code, to quickly protoptype and iterate on ideas with software, and as a medium of technical communication.  The context switching between these tools and traditional software develepoment approaches can be frustrating.  Not only do you loose the ability to iterate fast (copy & pasting code from a REPL to a text editor), but you lose the ability to document and test your code in-situ requring you to create documentation and tests seperately from source code.  

Today, we are announcing an integration between Quarto and [nbdev](https://github.com/fastai/nbdev), a [literate programming framework](https://en.wikipedia.org/wiki/Literate_programming) that allows you to use a common set of tools to not only write documentation, websites and blogs, but also test and distribute software packages in a development workflow without context-switching.

In this talk, Hamel will demonstrate how nbdev and Quarto can work together to simulteanously offer a highly productive way of programming while encouraging software development best practices. 
