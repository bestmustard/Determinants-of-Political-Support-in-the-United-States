#### Preamble ####
# Purpose: Simulates the 2020 presidential election results by age, gender, education
# Author: Victor Ma
# Date: 16 March 2024
# Contact: victo.ma@mail.utoronto.ca
# In this simulation I use code from Alexander, Rohan 
# Code can be found at https://tellingstorieswithdata.com/13-ijaglm.html#political-support-in-the-united-states


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(853)

num_obs <- 1000 

us_political_preferences <- tibble( # simulate an example election
  education = sample(0:4, size = num_obs, replace = TRUE), # pick each variable uniformly 
  gender = sample(0:1, size = num_obs, replace = TRUE),
  age = sample(0:3, size = num_obs, replace = TRUE),
  support_prob = ((education + gender + age) / 8), 
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
    age = case_when(
      age == 0 ~ "18-29",
      age == 1 ~ "30-44",
      age == 2 ~ "45-64",
      age == 3 ~ "65+",
    ),
    gender = if_else(gender == 0, "Male", "Female")
  ) |>
  select(-support_prob, supports_biden, gender, age, education)

