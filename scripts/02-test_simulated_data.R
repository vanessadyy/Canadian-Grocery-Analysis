#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

# Load the necessary libraries
library(testthat)
library(dplyr)
library(lubridate)

# Source the code containing the simulated data (or include the function if you defined it as a function)
# For example, if it's a function named `simulate_data` in simulate_data.R file, use:
# source("simulate_data.R")

# Set up the simulated data for testing
set.seed(123)
simulated_data <- read.csv('data/00-simulated_data/simulated_data.csv')

# Begin the tests
test_that("Simulated data has correct structure and types", {
  expect_true(is.data.frame(simulated_data))
  
  # Check column names
  expect_equal(names(simulated_data), c("X","nowtime", "vendor", "product_id", "product_name", "brand",
                                        "current_price", "old_price", "units", "price_per_unit", "other"))
  
  # Check data types
  expect_true(is.character(simulated_data$vendor))
  expect_true(is.numeric(simulated_data$product_id))
  expect_true(is.character(simulated_data$product_name))
  expect_true(all(is.na(simulated_data$brand)))  # Column should be all NA
  expect_true(is.numeric(simulated_data$current_price))
  expect_true(is.numeric(simulated_data$old_price) || all(is.na(simulated_data$old_price)))
  expect_true(is.character(simulated_data$units))
  expect_true(is.character(simulated_data$price_per_unit))
  expect_true(is.character(simulated_data$other) || all(is.na(simulated_data$other)))
})

test_that("Simulated data values are within expected ranges", {
  # Check current price range
  expect_true(all(simulated_data$current_price >= 3 & simulated_data$current_price <= 8))
  
  # Check old price range (if not NA)
  old_price_non_na <- simulated_data$old_price[!is.na(simulated_data$old_price)]
  expect_true(all(old_price_non_na >= 5 & old_price_non_na <= 10))
  
  # Check vendor and units
  expect_true(all(simulated_data$vendor == "Voila"))
  expect_true(all(simulated_data$units == "310g"))
