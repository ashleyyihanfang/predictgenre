

# loading packages --------------------------------------------------------

library(spotifyr)
library(tidyverse)


# Access token ------------------------------------------------------------

Sys.setenv(SPOTIFY_CLIENT_ID = '3aae041578b64519942b572adc41f54b')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '65a6e367b99440188274db79c1967af0')

token <- get_spotify_access_token()


# 2019 --------------------------------------------------------------------

pop <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DXau6DEOS07fE")

rnb <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWT2DKEIZ0ILA")

fna <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWYdLqwKCcDiy")

hiphop <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX4ykqMZqUn3L")

indie <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWTc5QDlvD7t0")

cng <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX5JHlV94wGBQ")

latin <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "2P3A4oybmznGl3rRXfH6YQ")

afropop <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DXdD040nrEzxm")

rock <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX5gBZa9tnZTY")

country <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX3RCeShx2suK")

dance <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWYEA2z2jQnzS")


# 2020 --------------------------------------------------------------------

indie1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWWkGXMGv9j4M")

country1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWYvU2z6HruAo")

dance1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX6IfVEzIj7ws")

latin1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWT2aDOU7r4aV")

cng1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DXcc1yE5Uu48n")

hiphop1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWW5pQp5JqjY4")

rock1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX2UyG74cWOyT")

pop1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX5QPo288x03n")

rnb1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWVYxTSK0RENg")

fna1 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX4VkeNQew5Ex")



# 2010s -------------------------------------------------------------------

hiphop2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX4pjbxDJiPrn")

indie2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWTHM4kX49UKs")

cng2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DXaJDplEJVP32")

country2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DXaB64wwvEuUo")

dance2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX8D2YR1GbW3K")

rock2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWViLl4FIAFJf")

pop2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWSs8ya2jFSgv")

rnb2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWXbttAJcbphz")

fna2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DX0dClrg1J8Br")

latin2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWZQkHAMKYFuV")

afropop2 <- get_playlist_audio_features("22ninnvunp2oxzypbp6gpvrty", "37i9dQZF1DWWHMKZF8dZSb")


# saving raw files --------------------------------------------------------

pop3 <- rbind(pop, pop1, pop2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "pop") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/pop_raw.csv")

rnb3 <- rbind(rnb, rnb1, rnb2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "rnb") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/rnb_raw.csv")

fna3 <- rbind(fna, fna1, fna2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "fna") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/fna_raw.csv")

hiphop3 <- rbind(hiphop, hiphop1, hiphop2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "hiphop") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/hiphop_raw.csv")

indie3 <- rbind(indie, indie1, indie2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "indie") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/indie_raw.csv")

cng3 <- rbind(cng, cng1, cng2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "cng") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/cng_raw.csv")

latin3 <- rbind(latin, latin1, latin2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "latin") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/latin_raw.csv")

afropop3 <- rbind(afropop, afropop2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "afropop") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/afropop_raw.csv")

rock3 <- rbind(rock, rock1, rock2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "rock") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/rock_raw.csv")

country3 <- rbind(country, country2, country1) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "country") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/country_raw.csv")

dance3 <- rbind(dance, dance1, dance2) %>% 
  unnest(track.artists) %>% 
  select(-c(track.album.artists, track.album.images, 
            track.album.available_markets, track.available_markets)) %>% 
  distinct(track.uri, .keep_all = TRUE) %>% 
  mutate(genre = "dance") %>% 
  write_csv("Desktop/stat301-2/final_project/data/unprocessed/dance_raw.csv")
















