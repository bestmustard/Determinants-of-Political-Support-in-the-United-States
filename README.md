# Determinants-of-Political-Support-in-the-United-States

## Overview

This repo is an analysis on how various demographics determine political affiliation specifically based on the 2020 US presidential election. Data was obtained from the 2020 Cooperative Election Study (CES), cleaned and analysed in order to fit a logistic regression model.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from CCES 2020.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Reproducibility

Scripts are included in the /scripts folder to download the data from dataverse, clean it, and upload it into the /data folder. The paper markdown file uses the analysis_data.csv file directly from this folder. 

## Statement on LLM usage

Aspects of the code were written with the help of the auto-complete tool, CHATGPT4. The test file, weaknesses section, and various ggplot graphs were written with the help of CHATGPT4.
