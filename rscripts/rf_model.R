library(tidyverse)
library(tidymodels)
set.seed(123)
tracks <- read_csv("/Users/ashleyfangyihan/Desktop/stat301-2/final_project/data/processed/tracks.csv")
tracks <- tracks %>% 
  mutate(genre = factor(genre),
         loudness = (-1 / loudness))

tracks_split <- initial_split(tracks, prop = 0.8, strata = genre)
tracks_train <- training(tracks_split)
tracks_test <- testing(tracks_split)

tracks_folds <- vfold_cv(data = tracks_train, v = 5, repeats = 5)

recipe <- recipe(genre ~ danceability + energy + key + loudness + speechiness +
                   acousticness + instrumentalness + liveness + valence +
                   tempo + popularity, data = tracks_train) %>% 
  step_normalize(all_predictors())

# random forest
rf_model <- rand_forest(mode = "classification", mtry = tune(),
                        min_n = tune()) %>% 
  set_engine("ranger", importance = "impurity")

# random forest
rf_params <- parameters(rf_model) %>% 
  update(mtry = mtry(range = c(1, 11)))
rf_grid <- grid_regular(rf_params, levels = 5)

# random forest
rf_workflow <- workflow() %>% 
  add_model(rf_model) %>% 
  add_recipe(recipe)

# random forest
rf_tuned <- rf_workflow %>% 
  tune_grid(tracks_folds, grid = rf_grid) %>% 
  write_rds("rf_model.rds")

