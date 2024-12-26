# Final Project: Computational Statistics and Probability

**Program:** Master’s in Artificial Intelligence  
**Course:** Computational Statistics and Probability  
**Date:** December 21, 2023  

## Project Overview
This repository contains the final project for my Master’s in AI course on *Computational Statistics and Probability*. It focuses on exploring factors influencing cardiovascular health using the **NHANES** (National Health and Nutrition Examination Survey) dataset.

## Objective
- Investigate the relationship between **systolic blood pressure (BPSysAve)** and **total cholesterol (TotChol)** on cardiovascular health.
- Examine the roles of **Age**, **BMI**, and other lifestyle factors (physical activity, TV hours per day).
- Develop a **logistic regression** model to predict “good” vs. “poor” cardiovascular health.

## Repository Contents
- **README.md**: Overview of the project, objectives, and instructions.
- **final_project_code.R**: R script containing data preparation, exploratory analyses, visualizations, and logistic regression modeling.

## Data Source
- **NHANES** (National Health and Nutrition Examination Survey)
  - Loaded via the [NHANES R package](https://cran.r-project.org/web/packages/NHANES/).

## Methodology

1. **Data Preparation**  
   - Subset and clean data from the `NHANES` package.  
   - Create a binary variable **CardioHealth** (1 = “good” based on thresholds, 0 = “poor”).

2. **Exploratory Data Analysis (EDA)**  
   - Descriptive statistics of core variables (Age, BMI, BPSysAve, BPDiaAve, TotChol, etc.).  
   - Scatter plots, boxplots, histograms, and bar plots to visualize relationships.

3. **Logistic Regression**  
   - Fitted with `logistf` to examine how `BPSysAve` and `TotChol` predict cardiovascular health.  
   - Added predicted values to the dataset for further analysis.

4. **Visualization**  
   - Scatter plots for key variable pairs.  
   - Boxplots to show the distribution of BPSysAve across different health groups.  
   - Histograms to understand TotChol distribution.  
   - Bar plots to observe the frequency of TV hours per day.

## Usage Instructions

1. **Clone or Download** this repository.
   ```bash
   git clone https://github.com/VARDHAN-BORA/CS---P-Final_Project.git
