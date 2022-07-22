---
# Do not edit
talk_id: 22036
talk_slug: accelerating-geospatial-computing-using-apache
talk_type: lightning
talk_tags: [interop, production, spatial]
session_slug: lightning-talks
sched_url: https://rstudioconf2022.sched.com/event/11iab
# ---- Edit information below this line ----
# The title of your talk
talk_title: "Accelerating geospatial computing using Apache Arrow"
# A short version of the title, suitable for small displays
talk_title_short: Accelerating geospatial computing using Apache Arrow
# A link to your talk's materials, when ready
talk_materials_url: ~
speakers:
- name: Dewey Dunnington
  affiliation: Voltron Data
  url:
    webpage: https://dewey.dunnington.ca
    twitter: https://twitter.com/paleolimbot
    github: https://github.com/paleolimbot/
    linkedin: https://www.linkedin.com/in/deweydunnington/
    affiliation: https://voltrondata.com/
  username: dewey_dunnington
  photo: /assets/img/2022Conf/_talks/22036_dewey-dunnington.jpg
  bio: |+
    Dewey Dunnington (Ph.D., P.Geo.) is an environmental researcher,
    programmer, and educator based in Nova Scotia, Canada. He recently
    completed his Ph.D. in lake sediment geochemistry and is currently an
    R Developer at [Voltron Data](https://voltrondata.com/) working on all
    things [Apache Arrow](https://arrow.apache.org/) + R.


---

<!-- ABSTRACT ----
Please write abstract below. You may use simple markdown (links, code style, bold, italics)
-->

The ‘arrow’ R package and wider Apache Arrow ecosystem provide an end-to-
end solution for querying and computing on in-memory and bigger-than-memory
data sets using the Apache Arrow C++ library. In this talk we introduce the
‘geoarrow’ package, which extends Arrow to provide efficient columnar storage
for spatial types and functions to support spatial queries in the Arrow compute
engine. We focus on a workflow where (1) data are stored in multiple files
that can be hosted remotely (e.g., on S3-compatible storage), (2) queries are
processed batchwise and in parallel allowing for efficient processing of bigger-
than-memory geospatial data and (3) results can be passed without copying to
Rust, Python, or other R packages for further analysis.
