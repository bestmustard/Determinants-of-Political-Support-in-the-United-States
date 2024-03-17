#### Preamble ####
# Purpose: TESTS FOR SIMULATION wrtten with chatgpt4
# Author: Victor Ma
# Date: 15 Mar 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)



# Ensure that education levels and gender have been assigned correctly
test_education_levels <- table(us_political_preferences$education)
test_gender_distribution <- table(us_political_preferences$gender)

# Printing to check distribution - you may replace this with an assertion for automated testing
print(test_education_levels)
print(test_gender_distribution)


# Calculating expected vs actual proportion of Biden supporters
biden_supporters <- us_political_preferences %>%
  group_by(education, gender) %>%
  summarize(
    num_supporters = sum(supports_biden == "yes"),
    total = n(),
    prop_supporters = num_supporters / total
  )

# Inspecting the proportion of supporters - replace with more rigorous statistical testing as needed
print(biden_supporters)

# Check for NA values
any_na <- anyNA(us_political_preferences)
print(paste("Any NA values in the data:", any_na))

# Check for unexpected categories in 'education' and 'gender'
education_categories <- unique(us_political_preferences$education)
gender_categories <- unique(us_political_preferences$gender)

print("Education categories:")
print(education_categories)

print("Gender categories:")
print(gender_categories)

# Assertion example for automated testing
# This is a simple check to ensure the 'education' variable has exactly 5 unique categories as defined
stopifnot(length(education_categories) == 5)
