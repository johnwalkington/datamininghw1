library(tidyverse)
library(ggplot2)

#1A

billboard = billboard %>% 
  filter(year>1958) %>% 
  select(performer, song, year,week, week_position)

top10 = billboard %>% 
  group_by(performer,song) %>% 
  summarize(count=n()) %>% 
  arrange(desc(count)) %>% 
  head(10)
