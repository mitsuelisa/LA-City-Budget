library(tidyverse)
library(readxl)
library(readr)
library(janitor)
library(dplyr)


City_Budget_and_Expenditures <- read_excel("C:/Users/mitsu/Downloads/City_Budget_and_Expenditures.xlsx") %>% 
  clean_names()
  
LA_Expenditures_By_Year <- City_Budget_and_Expenditures %>% 
# filter(department_name == "WATER AND POWER") %>% 
# filter(fund_name == contains("WATER", "WS")) %>%
# mutate(department_name = recode("WATER", .default = "POWER")) %>%
  
select(budget_fiscal_year,department_name,total_expenditures) %>% 
group_by(budget_fiscal_year,department_name) %>% 
summarise(total_expenditures = sum(total_expenditures , na.rm = TRUE)) %>%
mutate(sectors = recode(department_name, "AGING" = "HEALTH", 
                          "INFORMATION TECHNOLOGY AGENCY" = "COMMUNICATION",
                          "CITY EMPLOYEES RETIREMENT SYSTEM" = "EDUCATION & CULTURE", 
                          "CULTURAL AFFAIRS" = "EDUCATION & CULTURE",
                          "LIBRARY" = "EDUCATION & CULTURE",
                          "ZOO" = "EDUCATION & CULTURE",
                          "EL PUEBLO DE LOS ANGELES HISTORICAL MONUMENT AUTHORITY" = "EDUCATION & CULTURE",
                          "ANIMAL SERVICES" = "HEALTH",
                          "CANNABIS REGULATION" = "HEALTH",
                          "DISABILITY" = "HEALTH",
                          "PUBLIC WORKS - SANITATION" = "HEALTH",
                          "BUILDING AND SAFETY" = "HOUSING",
                          "CITY PLANNING" = "HOUSING",
                          "HOUSING AND COMMUNITY INVESTMENT DEPARTMENT" = "HOUSING",
                          "RECREATION AND PARKS" = "HOUSING",
                          "CONTROLLER" = "SAFETY",
                          "EMERGENCY MANAGEMENT" = "SAFETY",
                          "EMERGENCY OPERATIONS BOARD" = "SAFETY",
                          "FIRE" = "SAFETY",
                          "POLICE" = "SAFETY",
                          "PUBLIC WORKS - STREET LIGHTING" = "HOUSING",
                          "CITY ADMINISTRATIVE OFFICER" = "SAFETY",
                          "PENSION" = "SAFETY",
                          "CITY ATTORNEY" = "SOCIAL SERVICES",
                          "CITY CLERK" = "SOCIAL SERVICES",
                          "CITY ETHICS COMMISSION" = "SOCIAL SERVICES",
                          "NEIGHBORHOOD EMPOWERMENT" = "SOCIAL SERVICES",
                          "AIRPORTS" = "TRANSPORTATION",
                          "HARBOR" = "TRANSPORTATION",
                          "TRANSPORTATION" = "TRANSPORTATION",
                          "WATER AND POWER" = "WATER AND POWER",
                          .default = "OTHER")) %>%
mutate(sectors = recode(sectors, "HOUSING" = "CITY PLANNING")) %>%


select(budget_fiscal_year,sectors,total_expenditures) %>% 
group_by(budget_fiscal_year,sectors) %>% 
summarise(total_expenditures = sum(total_expenditures , na.rm = TRUE)) %>%
view() %>%
  
ggplot(aes(x = sectors, y = total_expenditures)) + 
  geom_point() +
  facet_grid(~budget_fiscal_year)



  
#write_csv( path = "data/sectors_complete.csv")


  
  