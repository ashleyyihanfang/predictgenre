

# packages -------------------------------------------------------------------------

library(spotifyr)
library(tidyverse)

# loading raw data ----------------------------------------------------------

pop <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/pop_raw.csv")

rnb <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/rnb_raw.csv")

fna <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/fna_raw.csv")

hiphop <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/hiphop_raw.csv")

indie <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/indie_raw.csv")

cng <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/cng_raw.csv")

latin <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/latin_raw.csv")

afropop <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/afropop_raw.csv")

rock <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/rock_raw.csv")

country <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/country_raw.csv")

dance <- read_csv("Desktop/stat301-2/final_project/data/unprocessed/dance_raw.csv")


# joining and cleaning ----------------------------------------------------

tracks <- rbind(pop, rnb, fna, hiphop, indie, cng, latin, 
                 afropop, rock, country, dance) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  select(c(danceability, energy, key, loudness, speechiness, acousticness, instrumentalness, 
           liveness, valence, tempo, name, track.name, track.popularity, genre
  )) %>%
  rename(artist.name = name,
         popularity = track.popularity)

tracks <- tracks[c(11, 12, 14, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13)]

tracks %>% write_csv("Desktop/stat301-2/final_project/data/processed/tracks.csv")

