# predictgenre

Using the package spotifyr, I retrieved the audio and track characteristics of 2233 tracks from Spotify Web API. The 2233 tracks belong to a total of 11 music genres; all were obtained from Spotify’s year-end “best of” playlists:

Best of 2019: Hip-hop, Indie, Gospel, Country, Dance, Rock, Pop, R&B, Afropop, Latin, Folk. 

Best of 2020: Hip-hop, Indie, Country, Dance, Rock, Pop, R&B, Afropop, Latin, Folk. 

Best of the 2010s decade (not including 2020): Hip-hop, Indie, Gospel, Country, Dance, Rock, Pop, R&B, Afropop, Latin, Folk. 

I pulled track data from each of the playlists above, joined the datasets together, and removed duplicate tracks based on their unique track ID. Since Spotify API doesn’t offer track genre as a variable, I assigned genres to tracks based on the playlists they were from. Using spotifyr, I was able to obtain a data frame of 63 variables for each track, and I only selected 14 variables that are most relevant for modeling: the track name, artist name, 11 predictors, and the outcome variable genre. The dataset contains information for 2233 tracks, with around 200 tracks from each genre. A detailed walk-through of the data collection and cleaning process can be found in the R scripts, and descriptions of each variable can be found in the codebook “data/processed/tracks_codebook.rtf”. 
