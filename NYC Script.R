library(tidyverse)
library(readxl)
library(readr)
library(janitor)
library(dplyr)

NYC <- read_excel("data/NYC.xlsx") %>% 
  clean_names()

NYC