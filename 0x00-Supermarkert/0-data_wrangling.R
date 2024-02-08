#!/usr/bin/R
# Loding packages ...
library(magrittr)
library(tidyverse)
library(corrplot)
library(tseries)
library(forecast)
library(tactile)
library(sandwich)
library(urca)
library(TSA)
library(caschrono)
library(TSstudio)
library(knitr)
library(stargazer)
library(broom)
library(knitLatex)
library(readxl)
library(GGally)

# Import  the dataset
Super_mark<-read.csv("supermarket_sales - Sheet1.csv")
#Make a copy of the dataset
Super_mark_copy<-Super_mark
# First six rows
Super_mark_copy %>% head()
# Last six rows
Super_mark_copy %>% head()
# Sampling: six obervations
Super_mark_copy %>% sample_n(6)
# Sampling: 5% of the data
Super_mark_copy %>% sample_frac(0.05)
#Check if the data contains NAs...
Super_mark_copy %>% is.na() %>% sum()

#Structure of the data
Super_mark_copy %>% glimpse()# or
Super_mark_copy %>% str()

# Unique values of variables that must be transformed to factors
Super_mark_copy %>% select_if(is.character) %>%
select(-c(Invoice.ID, Date, Time)) %>%
     apply (., 2, unique) # or

# Convert the columns into factors
Super_mark_copy %<>%
        mutate(across(where(is.character) & !c("Invoice.ID", "Date", "Time"), as.factor))
#Test
Super_mark_copy %>% glimpse()

# Concert to date time
Super_mark_copy %<>%
     mutate(Date_time =
                 mdy_hm(paste(Date, Time,
                              sep =  " " ))
     )%>%
     select(-Date, -Time)
#Test
Super_mark_copy %>% tibble()
