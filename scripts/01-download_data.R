#### Preamble ####
# Purpose: Downloads and saves the 2020 CCES data recorded by Schaffner, Brian et.al 
# Author: Victor Ma
# Date: 15 Mar 2024
# Contact: victo.ma@mail.utoronto.ca
# License: MIT

#### Workspace setup ####

#install.packages("arrow")
library(tidyverse)
library(dataverse)
library(dplyr)

#### Download data ####
ces2020 <-
  get_dataframe_by_name(
    filename = "CES20_Common_OUTPUT_vv.csv",
    dataset = "10.7910/DVN/E9N6PH",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) 

#### Save data ####
write_csv(ces2020, "data/raw_data/raw_data.csv")
