library(tidyverse)
library(ggplot2)
library(modelr)
library(rsample)
library(mosaic)
library(caret)
library(foreach)
library(parallel)
library(colorDF)
library(knitr)

data(SaratogaHouses)

#scaling the variables
SaratogaHouses = SaratogaHouses %>%
  mutate(across(c(lotSize, age, landValue, livingArea, pctCollege, bedrooms, fireplaces, bathrooms, rooms), scale))

#create folds and run for 3 different models
k_folds = 20
SaratogaHouses_folds = crossv_kfold(SaratogaHouses, k = k_folds)

#refers to the medium model done in class
lm_medium = map(SaratogaHouses_folds$train, ~ lm(price ~ . - pctCollege - sewer - waterfront - landValue - newConstruction, data=., use.all=FALSE))
r_medium = map2_dbl(lm_medium, SaratogaHouses_folds$test, modelr::rmse)
linear_medium_rmse = mean(r_medium)

#best linear model
lm1 = map(SaratogaHouses_folds$train, ~ lm(price ~ . - pctCollege - sewer - waterfront - newConstruction, data=., use.all=FALSE))
r1 = map2_dbl(lm1, SaratogaHouses_folds$test, modelr::rmse)
linear_rmse = mean(r1)

#best KNN model
k_grid = seq(1,100, by=2)
knn_grid = foreach(k= k_grid, .combine = 'rbind') %do% {
  models = map(SaratogaHouses_folds$train, ~knnreg(price ~ . - pctCollege - sewer - waterfront - newConstruction, k = k, data= ., use.all= FALSE))
  errs = map2_dbl(models, SaratogaHouses_folds$test, modelr::rmse)
  c(k = k, err = mean(errs), std_err = sd(errs)/sqrt(k_folds))
} %>% as.data.frame

knn_rmse = knn_grid %>%
  filter(err==min(knn_grid$err)) %>%
  as.data.frame()

tab = matrix(c(linear_medium_rmse,linear_rmse,knn_rmse$err), ncol = 1, byrow = TRUE)
colnames(tab) = c("Model")
rownames(tab) = c("Medium Model","Linear Model","KNN Model")
knitr::kable(head(tab))

summary(lm1$`1`)
