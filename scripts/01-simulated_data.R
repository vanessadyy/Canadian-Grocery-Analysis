#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]



# Load required libraries
library(dplyr)
library(lubridate)

# Set seed for reproducibility
set.seed(123)

# Parameters for simulation
n <- 148  # Number of rows

# Simulate data
simulated_data <- data.frame(
  nowtime = sample(seq(ymd_hms("2024-06-01 00:00:00"), ymd_hms("2024-06-30 23:59:59"), by = "hour"), n, replace = TRUE),
  vendor = rep("Voila", n),
  product_id = rep(5361, n),
  product_name = rep("Nature Valley Protein Granola Cereal, Oats 'n Honey", n),
  brand = NA,  # Empty column as in original data
  current_price = round(runif(n, 3, 8), 2),  # Random prices between 3 and 8
  old_price = ifelse(runif(n) > 0.2, round(runif(n, 5, 10), 2), NA),  # 80% chance of an old price, between 5 and 10
  units = rep("310g", n),
  price_per_unit = paste0("$", round(runif(n, 1, 3), 2), "/100g"),  # Random price per unit in similar format
  other = ifelse(runif(n) > 0.2, "SALE", NA)  # 80% chance of "SALE" tag
)

write.csv(simulated_data, 'data/00-simulated_data/simulated_data.csv')
