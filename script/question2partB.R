setwd("~/Desktop/dataminingsp22/datamininghw1/data")

library(tidyverse)
library(ggplot2)
billboard = read.csv("billboard.csv", header = TRUE)

billboardfilter = billboard %>%
  filter(between(year,1959,2020)) %>%
  group_by(year) %>%
  count(song) %>%
  count(year)

ggplot(data = billboardfilter, aes(x = year, y = n)) +
  geom_line() +
  labs(title = "Song diversity by year", x = "Year", y = "# of unique songs")