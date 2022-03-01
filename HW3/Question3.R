library(tidyverse)
library(ggplot2)
library(modelr)
library(rsample)
library(mosaic)
library(here)

german_credit = read.csv(here("HW3/german_credit.csv"))

counts = table(german_credit$Default, german_credit$history)
barplot(counts, 
        col = c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

logit_loan = glm(Default ~ duration + amount + installment + age + history + purpose + foreign, data = german_credit, family = 'binomial')

phat_logit = predict(logit_loan, german_credit, type = 'response')
yhat_logit = ifelse(phat_logit>0.5,1,0)
conf_matrix = table(y = german_credit$Default,
                    yhat = yhat_logit)
conf_matrix
