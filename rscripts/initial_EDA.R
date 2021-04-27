

# packages ----------------------------------------------------------------

library(tidyverse)
library(tidymodels)
set.seed(123)
tracks <- read_csv("Desktop/stat301-2/final_project/data/processed/tracks.csv")


# EDA ---------------------------------------------------------------------

tracks <- tracks %>% 
  mutate(genre = factor(genre),
         loudness = (-1 / loudness))

tracks %>% 
  ggplot(aes(x = genre)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 30, size = 10))

tracks %>% 
  ggplot(aes(x = valence)) +
  geom_histogram()


# split -------------------------------------------------------------------

tracks_split <- tracks %>% 
  initial_split(prop = 0.7, strata = genre)

tracks_train <- training(tracks_split)
tracks_test <- testing(tracks_split)
dim(tracks_train)
dim(tracks_test)
skimr::skim(tracks_train)


# recipe ------------------------------------------------------------------

recipe <- recipe(genre ~ danceability + energy + key + loudness + speechiness +
                 acousticness + instrumentalness + liveness + valence +
                 tempo + popularity, data = tracks_train) %>% 
  step_normalize(all_predictors())

recipe %>% prep()

lm_model <- linear_reg() %>% 
  set_engine("lm") %>% 
  set_mode("classification")

lm_workflow <- workflow() %>% 
  add_recipe(recipe) %>% 
  add_model(lm_model)

lm_fit <- fit(lm_workflow, tracks_train)
  
rf_default_model <- rand_forest() %>% 
  set_engine("ranger") %>% 
  set_mode("classification")

rf_default_workflow <- workflow() %>% 
  add_model(rf_default_model) %>% 
  add_recipe(recipe)

rf_default_fit <- fit(rf_default_workflow, tracks_train)

rf_default_fit


rf_predictions <- predict(rf_default_fit, tracks_test) %>% 
  bind_cols(truth = tracks_test$genre)

accuracy(rf_predictions, truth = truth, estimate = .pred_class)

