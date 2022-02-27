library(tidyverse)
library(magrittr)
library(lubridate)
library(ggplot2)
library(here)

#here has been defined to refer the folder Data-Mining-PS2
capmetro_UT = read.csv(here("HW1/capmetro_UT.csv"))

#Recoding the categorical variable to display in meaningful order
capmetro_UT = mutate(capmetro_UT,
                     day_of_week = factor(day_of_week,
                                          levels=c("Mon", "Tue", "Wed","Thu", "Fri", "Sat", "Sun")),
                     month = factor(month,
                                    levels=c("Sep", "Oct","Nov")))

#make the first plot
#make a table with necessary grouping
plot1 = capmetro_UT %>%
  group_by(hour_of_day, day_of_week, month) %>%
  summarise(avg_boarding = mean(boarding))

#label all facets by full name of the day
day_name = list(
  "Mon" = "Monday",
  "Tue" = "Tuesday",
  "Wed" = "Wednesday",
  "Thu" = "Thursday",
  "Fri" = "Friday",
  "Sat" = "Saturday",
  "Sun" = "Sunday"
)
name_labeller = function(variable,value){
  return(day_name[value])
}

#Plot line graphs faceted by day
ggplot(plot1, aes(x = hour_of_day, y = avg_boarding, colour = month))+
  geom_line()+
  facet_wrap(~day_of_week, labeller = name_labeller)+
  theme_minimal()+
  labs(
    x = "Time of the day",
    y = "Average boardings",
    caption = "The plot shows how the number of boraders on an average varies throughout the day for all 7 days of the week. The trends are depicted for 3 months as mentioned."
    )
)
  
#make the second plot
ggplot(capmetro_UT, aes(x = temperature, y = boarding, colour = weekend))+
  geom_point()+
  facet_wrap(~hour_of_day)+
  theme_minimal()+
  labs(
    x = "Temperature",
    y = "No of boardings in every 15-min window",
    caption = "The plot shows no of boardings across temperatures in intervals \n of 15 mins for every hour of the day."
    )+
  scale_color_discrete(name = "Type of the day")