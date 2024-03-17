#### Preamble ####
# Purpose: Cleans the raw 2020 CCES data recorded by Schaffner, Brian et.al 
# Author: Victor Ma
# Date: 15 Mar 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(arrow) # Ensure arrow is used for reading parquet

#### Clean data ####
raw_data <-
  read_parquet("data/raw_data/raw_data.parquet")

cleaned_data <-
  raw_data |>
  filter(votereg == 1, CC20_410 %in% c(1, 2)) |>
  mutate(
    voted_for = if_else(CC20_410 == 1, "Biden", "Trump"),
    voted_for = as_factor(voted_for),
    gender = if_else(gender == 1, "Male", "Female"),
    age = case_when(
      birthyr <= 1955  ~ "65+",
      birthyr > 1955 & birthyr <= 1975  ~ "45-64",
      birthyr > 1975 & birthyr <= 1990 ~ "30-44",
      birthyr > 1990 & birthyr <= 2002 ~ "18-29",
    ),
    age = factor(
      age,
      levels = c("65+", "45-64", "30-44", "18-29")
    ),
    education = case_when(
      educ == 1 ~ "No HS",
      educ == 2 ~ "High school graduate",
      educ == 3 ~ "Some college",
      educ == 4 ~ "2-year",
      educ == 5 ~ "4-year",
      educ == 6 ~ "Post-grad"
    ),
    education = factor(
      education,
      levels = c("No HS", "High school graduate", "Some college", "2-year", "4-year", "Post-grad")
    )
  ) |>
  select(voted_for, age, gender, education)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")
