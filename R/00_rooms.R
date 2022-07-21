tibble::tribble(
     ~track,                      ~room,              ~room_name, ~capacity,
  "plenary",           "0. Potomac A+B",           "Potomac A+B",      2176,
        "A",             "1. Potomac C",             "Potomac C",       540,
        "B",             "2. Potomac D",             "Potomac D",       540,
        "C",        "3. Cherry Blossom",        "Cherry Blossom",       720,
        "D", "4. National Harbor 10+11", "National Harbor 10+11",       490,
         NA,              "5. Maryland",              "Maryland",      1500, # meals (capacity: banquet, A+B+C+D)
         NA,    "6. Riverview Ballroom",    "Riverview Ballroom",        NA,
         NA,       "7. Orchard Terrace",       "Orchard Terrace",        NA
  )
