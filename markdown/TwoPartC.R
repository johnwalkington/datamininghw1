library(tidyverse)
library(mosaic)

setwd("~/School/UT/StatLearning/csvfiles")

billboard = read.csv("billboard.csv")

billboard_simp = billboard %>%
  select(song, performer, song_id, weeks_on_chart, year)

billboard_10w = billboard_simp %>%
  filter(weeks_on_chart == 10) %>%
  group_by(performer) %>%
  summarize(count = n()) %>%
  filter(count >= 30) %>%
  arrange(desc(count))

ggplot(billboard_10w) +
  geom_col(aes(x = performer, y = count, color = performer)) +
  coord_flip() +
  labs(title = "Number of Songs on Billboard's Top 100 For At Least 10 Weeks by Top Artists*", x = "Performer", y = "Number of Songs", caption = "*Data was filtered for artists who had at least 30 songs that appeared for at least 10 weeks.") +
  theme(legend.position = "none")
