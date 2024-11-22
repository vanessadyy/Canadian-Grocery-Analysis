#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 26 September 2024 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")


#### Test data ####

# Check if there are any NA values in the dataset
na_check <- any(is.na(analysis_data))
print(na_check)  # TRUE if no NA values, FALSE if there are NA values

# Check if price_per_unit, id, product_name, and vendor are character columns
check_character_columns <- function(column_name) {
  return(is.character(analysis_data[[column_name]]))
}

# Run the check on each column and print TRUE/FALSE
print(check_character_columns("product_name"))
print(check_character_columns("vendor"))
print(check_character_columns("price_per_unit"))

# Check if vendor contains the specified values
expected_vendors <- c("Voila", "Loblaws", "Metro", "NoFrills", "SaveOnFoods", "Walmart")
vendor_check <- all(analysis_data$vendor %in% expected_vendors)
print(vendor_check)  # TRUE if vendor contains only specified values, FALSE otherwise

# Check if there are any duplicate rows in the dataset
duplicate_check <- nrow(analysis_data) == nrow(unique(analysis_data))
print(duplicate_check)  # TRUE if no duplicates, FALSE if duplicates exist

