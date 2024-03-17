#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
ces_data <- read_csv("data/analysis_data/analysis_data.csv")

ces_data$voted_for <- as_factor(ces_data$voted_for)
ces_data$education <- factor(ces_data$education, levels = c("No HS", "High school graduate", "Some college", "2-year", "4-year", "Post-grad"))
### Model data ####
set.seed(853)

# Reducing the CES 2020 dataset for manageable computation
ces_data_reduced <- ces_data |> 
  slice_sample(n = 3000)


# Specifying the logistic regression model
political_preferences <- stan_glm(
  voted_for ~ age + education + gender,
  data = ces_data_reduced,
  family = binomial(link = "logit"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 853
)

# Saving and loading the model for future analysis
saveRDS(political_preferences, file = "models/political_preferences.rds")

