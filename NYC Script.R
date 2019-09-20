library(tidyverse)
library(readxl)
library(readr)
library(janitor)
library(dplyr)
library(tidyr)

NYC <- read_excel("data/NYC_sectors2.xlsx") %>% clean_names()

view(NYC)

#ggplot(NYC, aes(x = sectors, y = ependiture, fill = sectors)) + 
#geom_col() +
#facet_wrap(~year) 

#ggplot(NYC,
#  aes(x = year, y = ependiture, fill = sectors)) + 
# geom_col(position = 'fill')+
# theme_minimal()+
#labs(title = "NYC")+
# xlab("Year")+
# ylab("Percentage of total expenditures")

ggplot(NYC, aes(x = year, y = ependiture, fill = sectors)) + 
  geom_col()+
  theme_minimal()+
  labs(title = "NYC")+
  xlab("Year")+
  ylab("Expenditures")


