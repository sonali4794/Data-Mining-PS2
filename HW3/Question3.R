library(tidyverse)
library(ggplot2)
library(modelr)
library(rsample)
library(mosaic)
library(here)

german_credit = read.csv(here("HW3/german_credit.csv"))

tab = german_credit %>%
  group_by(history) %>%
  summarise(def_prob = sum(Default)/n()) %>%
  select(def_prob)%>%
  as.data.frame()


barplot(tab$def_prob, 
        main = "Probability of loan defaulting",
        xlab = "Type of credit",
        ylim = c(0,1),
        col = c("darkblue","red","green"), beside=TRUE)
        legend("topright",c("Good","Poor","Terrible"), fill = c("darkblue","red","green"))

german_credit_data = initial_split(german_credit, prob=0.8)
german_credit_train = training(german_credit_data)
german_credit_test = testing(german_credit_data)
        
logit_loan = glm(Default ~ duration + amount + installment + age + history + purpose + foreign, data = german_credit_train, family = 'binomial')
coef(logit_loan)%>% round(2)

phat_logit = predict(logit_loan, german_credit_test, type = 'response')
yhat_logit = ifelse(phat_logit>0.5,1,0)
conf_matrix = table(y = german_credit_test$Default,
                    yhat = yhat_logit)
conf_matrix
acc = (sum(diag(conf_matrix))/sum(conf_matrix))*100
