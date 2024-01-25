#### Preamble ####
# Purpose: Clean any N/A in the raw plane data, and keep only the variables necessary for the paper. 
# Author: Dong Jun Yoon
# Date: 25 January 2024
# Contact: dongjun.yoon@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("Homeless_deaths_by_demographics.csv")
raw_data <- read_csv("Homeless_deaths_by_cause.csv")
raw_data <- read_csv("Homeless_deaths_by_month.csv")

#Replace any numerical missing value with 0. 
data_cleaned <- raw_data
for (col in names(data_cleaned)) {
  if (is.numeric(data_cleaned[[col]])) {
    data_cleaned[[col]][is.na(data_cleaned[[col]])] <- 0
  }
}

#### Save data ####
write_csv(university_data, "outputs/data/analysis_data.csv")
