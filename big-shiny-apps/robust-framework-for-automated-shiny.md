---
# Do not edit
talk_id: 22091
talk_slug: robust-framework-for-automated-shiny
talk_type: regular
session_slug: big-shiny-apps
block: 4-8-session
# ---- Edit information below this line ----
# The title of your talk
talk_title: A Robust Framework for Automated Shiny App Testing
# A short version of the title, suitable for small displays
talk_title_short: A Robust Framework for Automated Shiny App Testing
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Sydeaka Watson
  affiliation: Eli Lilly and Co
  bio: |+
    Dr. Sydeaka Watson earned a Ph.D. in Statistics from Baylor University
    and has several years of teaching experience. As a Research Assistant
    Professor in The University of Chicago Biostatistics Laboratory, she
    consulted with over 110 biomedical research teams, specializing in
    statistical analysis and experimental design for clinical research
    studies. In both of her Senior Data Scientist roles in the AT&T Chief
    Data Office and at Elicit Insights, she used predictive analytics
    and visual tools to implement custom solutions for customer behavior
    analytics and customer management. Now, as Senior Advisor in the Eli
    Lilly Statistical Innovation Center, Dr. Watson develops tools that
    enhance clinical trial design workflows using machine learning, big
    data technologies, and data visualization.

  photo: /assets/img/2022conf/_talks/22091_sydeaka-watson.jpeg
  url:
    webpage: https://www.sydeaka.com/
    twitter: https://twitter.com/SydeakaWatson
    github: https://github.com/sydeaka
    linkedin: https://www.linkedin.com/in/sydeakawatson/
    affiliation: https://www.lilly.com/

---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

For production-grade Shiny applications, regression testing ensures that the
application maintains its core functionality as new features are added to the
app. With the help of various R and Python tools that programmatically interact
with the UI and examine UI outputs, regression test logic can be represented
programmatically and can run as often as needed. This gives the development team
an opportunity to catch and fix bugs before they are pushed to production.

In this talk, I will introduce a framework for automated testing of Shiny
applications both (1) during the development phase and (2) after the app is
deployed. I will share a demo Shiny app along with relevant shinytest and
Selenium code.
