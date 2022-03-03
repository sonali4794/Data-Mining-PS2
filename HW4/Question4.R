library(tidyverse)
library(ggplot2)
library(modelr)
library(rsample)
library(mosaic)
library(here)
library(foreach)
library(pROC)

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

#validation
hotels_vals = read.csv(here("HW4/hotels_val.csv"))

val_model = glm(children ~ . -arrival_date, data = hotels_vals, family = 'binomial')

phat_val_model = predict(val_model, hotels_vals, type = 'response')
yhat_val_model = ifelse(phat_val_model > 0.5, 1, 0)
conf_val_model = table(y = hotels_vals$children,
                 yhat = yhat_val_model)
conf_val_model

fpr = conf_val_model[1,2]/(conf_val_model[2,2]+conf_val_model[1,2])
tpr = conf_val_model[2,2]/(conf_val_model[2,2]+conf_val_model[2,1])

val_model_prob = predict(val_model, hotels_vals, type = 'response')
val_model_roc = roc(hotels_vals$children ~ val_model_prob, plot = TRUE, print.auc = TRUE)

k_folds = 20
hotels_vals_folds = hotels_vals %>%
  mutate(fold_id = rep(1:k_folds, length = nrow(hotels_vals)) %>% sample)

hotels_vals_folds = hotels_vals_folds %>%
  mutate(uniqueID = seq.int(nrow(hotels_vals_folds)))

view(hotels_vals_folds)

predictedprob = foreach(fold = 1:k_folds, .combine = 'rbind') %dopar% {
  md = glm(children ~ . -arrival_date, data = filter(hotels_vals_folds, fold_id != fold), family = 'binomial')
  
  phat_md = predict(md, data = filter(hotels_vals_folds, fold == fold_id), type = 'response')
  yhat_md = ifelse(phat_md>0.5, 1, 0)
  data.frame(predicted_prob = phat_md, whether_children = yhat_md, fold_id = fold)
}
view(predictedprob)
final = predictedprob %>%
  group_by(fold_id) %>%
  summarise(expected_bookings = sum(predicted_prob))
