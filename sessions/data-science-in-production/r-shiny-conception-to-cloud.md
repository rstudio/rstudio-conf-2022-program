---
# Do not edit
talk_id: 22136
talk_slug: r-shiny-conception-to-cloud
talk_type: regular
talk_tags: [process, production, shiny]
session_slug: data-science-in-production
# ---- Edit information below this line ----
# The title of your talk
talk_title: "R Shiny - From Conception to the Cloud"
# A short version of the title, suitable for small displays
talk_title_short: R Shiny - From Conception to the Cloud
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Ivonne Carrillo Dominguez
  affiliation: ~
  url:
    webpage: https://www.linkedin.com/in/ivonne-carrillo-dominguez/
    twitter: ~
    github: ~
    linkedin: https://www.linkedin.com/in/ivonne-carrillo-dominguez/
    affiliation: https://www.bixal.com/about/ivonne-carrillo-dominguez/
  username: ivonne_carrillo_dominguez
  photo: /assets/img/2022Conf/_talks/22136_ivonne-carrillo-dominguez.jpeg
  bio: |+
    Ivonne is a data engineer on the Data Science team at Bixal where
    she has worked for 5 years now. She works on data visualization,
    data processing, and data analysis. She received her B.S. in computer
    system engineering in Mexico. Before joining Bixal, she worked as
    a Software Engineer for over 10 years at IBM, Toshiba, GE. This
    experience has given her knowledge in several parts of a system, from
    the design to its validation. What she likes the most about her work
    is seeing the positive impact that it can have in people’s lives. She
    lives now in Fairfax, VA with her husband and doggy Moka and likes to
    bake cakes on the weekends.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

I will share how we published an R Shiny application to AWS, the decisions we
made, and what we learned in the process.

One challenge we faced was figuring out how we could develop collaboratively. We
needed to define our development workflow, including version control, dependency
management, and quality assurance.

Then, we needed to define the deployment method. R Studio is great for
development, but it may hide many of the aspects that break the application. We
used CI/CD workflows as much as possible to make sure our code was robust before
pushing the changes to production.

Lastly, our infrastructure team designed a framework that is replicable, so we
are ready to deploy new R Shiny applications quickly and focus on data analysis.
