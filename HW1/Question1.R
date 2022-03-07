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
    caption = "Fig 1: The plot shows how the number of boarders on an average varies throughout the day for all 7 days of the week. 
    The trends are depicted for 3 months as mentioned. Peak borading hour is similar across weekdays and across weekends but the pattern itself is different between weekdays and weekends.
    As expected, traffic on buses is much lesser on weekends than weekdays, since there are no classes over the weekend. The anomalies can be explained by holidays - 
    Monday September is labor day and therefore lesser traffic compared to other days and months.
    Likewise dip in boarders on wed/thurs/fri in november can be attributed to thanksgiving holidays",
    title = "Average boardings across 7 days of the week for 3 months"
    ) +
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0),
        plot.title.position = "panel",
        plot.title = element_text(hjust = 0.5))

#make the second plot
ggplot(capmetro_UT, aes(x = temperature, y = boarding, colour = weekend))+
  geom_point()+
  facet_wrap(~hour_of_day)+
  theme_minimal()+
  labs(
    x = "Temperature",
    y = "No of boardings",
    caption = "Fig 2: The plot shows no of boardings across temperatures in intervals of 15 mins for every hour of the day.
    We observe more boarders over the weekdays than weekends as expected (similar to what we found in previous plot). This behaviour spans over all temperatures.
    During the morning hours of the day boarding is lesser which is again not surprising as most classes and work shifts begin at aroun 9 am.
    Temperature does not significantly imapct number of boarders. This is to say that if UT students/employees have to commute via bus, there is very little
    influence of the temperature on that decision. Be it high or low gemperatures the boarders are distributed quite evenly.",
    title = "Number boarders facted through the hour of the day across varying temperature"
    )+
  scale_color_discrete(name = "Type of the day")+
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0),
        plot.title.position = "panel",
        plot.title = element_text(hjust = 0.5))