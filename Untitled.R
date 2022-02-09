library(tidyverse)
library(ggplot2)



#1
#Avergae Departure Delay by Carrier
airlines = c('AA',"UA","DL","WN","B6")

avg_hourly_delay = ABIA %>%
  filter(UniqueCarrier==airlines) %>% 
  mutate(DepHour = floor(DepTime/100)) %>% 
  group_by(DepHour, UniqueCarrier) %>% 
  summarise(avgdelay=mean(DepDelay))

ggplot(avg_hourly_delay) +
  geom_line(aes(y=avgdelay, x = DepHour, color=UniqueCarrier)) +
  labs(title ="Austin-Bergstrom Daily Average Departure Delays in 2008",
       y= "Average Delay (in Minutes)",
       x= "Hour of Day",
       color="Carriers") +
  scale_color_hue(labels= c("American Airlines", "JetBlue", 
  "Delta Airlines","United Airlines","Southwest Airlines"))

#Yearly Destinations (Doesn't have to be turned in)

#Popular_Dests_Filtered = c('DEN', 'PHX', 'ORD', 'ATL', 'LAX')
#popular_yearly_destinations = ABIA %>% 
  #filter(Dest==Popular_Dests_Filtered) %>%
  #mutate(Summer = ifelse(Month == 6 | Month == 7 | Month == 8,
     #yes="Summer", no="Not Summer")) %>% 
  #group_by(Dest, Month, Summer) %>% 
  #summarise(count=n()) %>% 
  #arrange(desc(count))

#ggplot(popular_yearly_destinations) +
  #geom_col(aes(y = count, x = factor(Month)))

#2A

billboard1 = billboard %>% 
  filter(year>1958) %>% 
  select(performer, song, year,week, week_position)

top10 = billboard1 %>% 
  group_by(performer,song) %>% 
  summarize(count=n()) %>% 
  arrange(desc(count)) %>% 
  head(10)

#2B


#2C (Parker did this, code with just a tad more brevity)

ten_week_hit= billboard %>% 
  filter(weeks_on_chart==10) %>% 
  group_by(performer) %>% 
  summarize(count=n()) %>% 
  filter(count>=30) %>% 
  arrange(desc(count))




