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

# elastic net
en_model <- multinom_reg(mode = "classification", penalty = tune(),
                         mixture = tune()) %>% 
  set_engine("glmnet")

# random forest
rf_model <- rand_forest(mode = "classification", mtry = tune(),
                        min_n = tune()) %>% 
  set_engine("ranger")

# boosted tree
bt_model <- boost_tree(mode = "classification", mtry = tune(),
                       min_n = tune(), learn_rate = tune()) %>% 
  set_engine("xgboost")

# nearest neighbors
nn_model <- nearest_neighbor(mode = "classification", neighbors = tune()) %>% 
  set_engine("kknn")

# elastic net
en_grid <- grid_regular(mixture(), penalty(), levels = 5)

# random forest
rf_params <- parameters(rf_model) %>% 
  update(mtry = mtry(range = c(1, 11)))
rf_grid <- grid_regular(rf_params, levels = 5)

# boosted tree
bt_params <- parameters(bt_model) %>% 
  update(mtry = mtry(range = c(1, 11)),
         learn_rate = learn_rate(range = c(-10, 0)))
bt_grid <- grid_regular(bt_params, levels = 5)

# nearest neighbors
nn_params <- parameters(nn_model)
nn_grid <- grid_regular(nn_params, levels = 5)

# elastic net
en_workflow <- workflow() %>% 
  add_model(en_model) %>% 
  add_recipe(recipe)

# random forest
rf_workflow <- workflow() %>% 
  add_model(rf_model) %>% 
  add_recipe(recipe)

# boosted tree
bt_workflow <- workflow() %>% 
  add_model(bt_model) %>% 
  add_recipe(recipe)

# nearest neighbors
nn_workflow <- workflow() %>% 
  add_model(nn_model) %>% 
  add_recipe(recipe)

# nearest neighbors
nn_tuned <- nn_workflow %>% 
  tune_grid(tracks_folds, grid = nn_grid) %>% 
  write_rds("nn_model.rds")

