library(tidyverse)
library(ggplot2)
library(modelr)
library(rsample)
library(mosaic)
library(here)
library(foreach)
library(pROC)
library(plotROC)
library(parallel)
library("leaps")
library("MASS")
library(caret)
library(dplyr)
library("doParallel")
library("tibble")
library(knitr)


hotels_dev = read.csv(here("HW4/hotels_dev.csv"))


#prepare a train/test split
hotels_dev_split = initial_split(hotels_dev, prop = 0.8)
hotels_dev_train = training(hotels_dev_split)
hotels_dev_test = testing(hotels_dev_split)

#baseline 1 model
baseline1 = glm(children ~ market_segment + adults + customer_type + is_repeated_guest, data = hotels_dev_train, family = 'binomial')

phat_baseline1 = predict(baseline1, hotels_dev_test, type = 'response')
yhat_baseline1 = ifelse(phat_baseline1 > 0.1, 1, 0)
conf_baseline1 = table(y = hotels_dev_test$children,
                    yhat = yhat_baseline1)
conf_baseline1

err_baseline1 = (sum(diag(conf_baseline1))/sum(conf_baseline1))*100
err_baseline1

#baseline 2 model
baseline2 = glm(children ~ . -arrival_date, data = hotels_dev_train, family = 'binomial')

phat_baseline2 = predict(baseline2, hotels_dev_test, type = 'response')
yhat_baseline2 = ifelse(phat_baseline2 > 0.5, 1, 0)
conf_baseline2 = table(y = hotels_dev_test$children,
                       yhat = yhat_baseline2)
conf_baseline2

err_baseline2 = (sum(diag(conf_baseline2))/sum(conf_baseline2))*100
err_baseline2

#best linear model
lm1 = lm(children ~ . , data = hotels_dev_train)

phat_lm1 = predict(lm1, hotels_dev_test, type = 'response')
yhat_lm1 = ifelse(phat_lm1 > 0.5, 1, 0)
conf_lm1 = table(y = hotels_dev_test$children,
                       yhat = yhat_lm1)
conf_lm1

err_lm1 = (sum(diag(conf_lm1))/sum(conf_lm1))*100
err_lm1

#step
train_control = trainControl(method = "cv", number = 20)
step_model = train(children ~ ., data = hotels_dev_train,
                   method = "leapSeq",
                   tuneGrid = data.frame(nvmax = 1:21),
                   trControl = train_control)
step_model$results
step_model$bestTune
summary(step_model$finalModel)
coef(step_model$finalModel, 17)

lm2 = lm(children ~ hotel + adults + meal + is_repeated_guest + reserved_room_type + booking_changes + customer_type + average_daily_rate + total_of_special_requests, data = hotels_dev_train)

phat_lm2 = predict(lm2, hotels_dev_test, type = 'response')
yhat_lm2 = ifelse(phat_lm2 > 0.5, 1, 0)
conf_lm2 = table(y = hotels_dev_test$children,
                 yhat = yhat_lm2)
conf_lm2

err_lm2 = (sum(diag(conf_lm2))/sum(conf_lm2))*100
err_lm2

#compare models
#plot ROC curves for all 4 models and pick the one with max area or auc value
baseline1_predict = predict(baseline1, hotels_dev_test, type = 'response')
baseline1_roc = roc(hotels_dev_test$children ~ baseline1_predict, plot=TRUE, print.auc=TRUE)
baseline2_predict = predict(baseline2, hotels_dev_test, type = 'response')
baseline2_roc = roc(hotels_dev_test$children ~ baseline2_predict, plot=TRUE, print.auc=TRUE)
lm1_predict = predict(lm1, hotels_dev_test, type = 'response')
lm1_roc = roc(hotels_dev_test$children ~ lm1_predict, plot=TRUE, print.auc=TRUE)
lm2_predict = predict(lm2, hotels_dev_test, type = 'response')
lm2_roc = roc(hotels_dev_test$children ~ lm2_predict, plot=TRUE, print.auc=TRUE)
plot(baseline1_roc, col = 'green')
plot(baseline2_roc, add=TRUE, col = 'red')
plot(lm1_roc, add=TRUE, col ='blue')
plot(lm2_roc, add=TRUE, col ='orange')
baseline1_auc = auc(hotels_dev_test$children, baseline1_predict)
baseline2_auc = auc(hotels_dev_test$children, baseline2_predict)
lm1_auc = auc(hotels_dev_test$children, lm1_predict)
lm2_auc = auc(hotels_dev_test$children, lm2_predict)
tab = matrix(c(baseline1_auc, baseline2_auc, lm1_auc, lm2_auc), ncol = 1, byrow = TRUE)
colnames(tab) = "Area under ROC Curves"
rownames(tab) = c("Baseline 1","Baseline 2", "Best Linear Model", "Stepwise linear Model")
knitr::kable(head(tab))

#validation
hotels_vals = read.csv(here("HW4/hotels_val.csv"))

val_model = glm(children ~ . -arrival_date, data = hotels_vals, family = 'binomial')

val_model_prob = predict(val_model, hotels_vals, type = 'response')
val_model_roc = roc(hotels_vals$children ~ val_model_prob, plot = TRUE, print.auc = TRUE)

#prediction
k_folds = 20
hotels_vals_folds = createFolds(hotels_vals$children, k=k_folds)

expected = lapply(hotels_vals_folds, function(x){
  hotels_vals_test = hotels_vals[x,]
  phat = predict(baseline2, hotels_vals_test, type = 'response')
  return(phat)
})

actual = lapply(hotels_vals_folds, function(x){
  hotels_vals_test = hotels_vals[x,]
  return(sum(hotels_vals_test$children))
})

expected_bookings = c()
abs_error = c()
for (i in seq(1,20)) {
  expected_bookings = append(expected_bookings, as.integer(sum(unlist(expected[i]))))
  abs_error = append(abs_error, as.integer(sum(unlink(actual[i])) - as.integer(expected_bookings[i])))
}

df_final = cbind(expected_bookings, actual)
df_final = rbind(df_final, df_final %>% apply(2, unlist) %>% apply(2, abs) %>% apply(2, sum)) %>% as.data.frame()


colnames(df_final) = c("Expected bookings", "Actual bookings")
kable(df_final)