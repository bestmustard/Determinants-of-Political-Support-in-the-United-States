#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# In this simulation I use code from Alexander, Rohan 
# Code can be found at https://tellingstorieswithdata.com/13-ijaglm.html#political-support-in-the-united-states


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(853)

num_obs <- 1000 

us_political_preferences <- tibble( # simulate an example election
  education = sample(0:4, size = num_obs, replace = TRUE),
  gender = sample(0:1, size = num_obs, replace = TRUE),
  support_prob = ((education + gender) / 5),
) |>
  mutate(
    supports_biden = if_else(runif(n = num_obs) < support_prob, "yes", "no"),
    education = case_when(
      education == 0 ~ "< High school",
      education == 1 ~ "High school",
      education == 2 ~ "Some college",
      education == 3 ~ "College",
      education == 4 ~ "Post-grad"
    ),
    gender = if_else(gender == 0, "Male", "Female")
  ) |>
  select(-support_prob, supports_biden, gender, education)

