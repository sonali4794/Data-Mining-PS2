library(tidyverse)
library(ggplot2)
library(modelr)
library(rsample)
library(mosaic)
library(caret)

data(SaratogaHouses)

rmse_lm = do(100)*{
saratoga_split = initial_split(SaratogaHouses, prop = 0.8)
saratoga_train = training(saratoga_split)
saratoga_test = testing(saratoga_split)

lm_medium = lm(price ~ . - pctCollege - sewer - waterfront - landValue - newConstruction, data=saratoga_train)
r_medium = rmse(lm_medium, saratoga_test)

lm1 = lm(price ~ . - pctCollege - sewer - waterfront - newConstruction, data=saratoga_train)
r1 = rmse(lm1, saratoga_test)

lm2 = lm(price ~ . - pctCollege - sewer - waterfront - newConstruction + I(landValue^2), data=saratoga_train)
r2 = rmse(lm2, saratoga_test)

df = data.frame(r_medium,r1,r2)

}
rmse_lm

model_medium = mean(rmse_lm$r_medium)
model1 = mean(rmse_lm$r1)
model2 = mean(rmse_lm$r2)

rmse_knn = do(100)*{
  saratoga_split = initial_split(SaratogaHouses, prop = 0.8)
  saratoga_train = training(saratoga_split)
  saratoga_test = testing(saratoga_split)
  
  knn_medium = knnreg(price ~ . - pctCollege - sewer - waterfront - landValue - newConstruction, data=saratoga_train, k = 15)
  rknn_medium = rmse(knn_medium, saratoga_test)
  
  knn1 = knnreg(price ~ . - newConstruction, data=saratoga_train, k = 15)
  rknn1 = rmse(knn1, saratoga_test)
  
  knn2 = knnreg(price ~ . - pctCollege - sewer - waterfront - newConstruction, data=saratoga_train, k = 18)
  rknn2 = rmse(knn2, saratoga_test)
  
  df1 = data.frame(rknn_medium, rknn1, rknn2)
  
}
rmse_knn

knnmodel_medium = mean(rmse_knn$rknn_medium)
knnmodel1 = mean(rmse_knn$rknn1)
knnmodel2 = mean(rmse_knn$rknn2)