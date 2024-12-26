
---
  
  ## 2. `final_project_code.R` (R script)
  
 
  
  ```r
####################################################
# Final Project: Computational Statistics and Probability
# Date: December 21, 2023
# Author: [Your Name]
#
# Purpose:
#   - Load and explore NHANES data
#   - Subset relevant variables and clean data
#   - Conduct exploratory data analysis (EDA)
#   - Perform logistic regression to predict cardiovascular health
#   - Generate plots for data visualization
#
####################################################

# Load required packages
library(NHANES)    # for the NHANES dataset
library(ggplot2)   # for data visualization
library(logistf)   # for logistic regression with Firth's correction

# 1. Data Preparation ----------------------------------------------

# Load NHANES dataset
data("NHANES")

# Select relevant variables
selected_vars <- c("Age", "BMI", "BPDiaAve", "BPSysAve",
                   "PhysActiveDays", "TotChol", "TVHrsDay", "Weight")

# Subset the data
subset_data <- NHANES[selected_vars]

# Remove rows with missing values
subset_data <- na.omit(subset_data)

# 2. Exploratory Data Analysis --------------------------------------

# Hypothesis:
# We hypothesize that BPSysAve and TotChol will be
# significant predictors of cardiovascular health.
# Age, BMI, and physical activity may also play roles.

# Descriptive Statistics
summary(subset_data)

# Correlation between Age and BPSysAve
cat("\nCorrelation between Age and BPSysAve:\n")
cat(cor(subset_data$Age, subset_data$BPSysAve), "\n")

# Scatter plot for Age vs. BPSysAve
ggplot(subset_data, aes(x = Age, y = BPSysAve)) +
  geom_point() +
  labs(title = "Scatter Plot of Age vs. BPSysAve",
       x = "Age",
       y = "Systolic Blood Pressure")

# 3. Create a Binary Outcome Variable --------------------------------

# Define thresholds (example: 120 for BPSysAve, 200 for TotChol)
threshold_BPSysAve <- 120
threshold_TotChol  <- 200

# 1 = Good CardioHealth; 0 = Poor CardioHealth
subset_data$CardioHealth <- ifelse(
  subset_data$BPSysAve <= threshold_BPSysAve &
    subset_data$TotChol <= threshold_TotChol,
  1, 0
)

# 4. Logistic Regression Modeling ------------------------------------

# Fit logistic regression model using logistf
model <- logistf(CardioHealth ~ BPSysAve + TotChol, data = subset_data)
cat("\nLogistic Regression Model Summary:\n")
print(model)

# Add predicted values to the dataset
subset_data$Predicted_CardioHealth <- ifelse(
  predict(model, type = "response") > 0.5, 1, 0
)

# 5. Additional Visualizations ---------------------------------------

# Scatter plot for Age vs. BMI colored by CardioHealth
scatter_matrix <- ggplot(subset_data, aes(x = Age, y = BMI, color = factor(CardioHealth))) +
  geom_point() +
  labs(title = "Scatter Plot of Age vs. BMI",
       x = "Age",
       y = "BMI",
       color = "Cardiovascular Health")

print(scatter_matrix)

# Boxplot of BPSysAve by CardioHealth
boxplot_bpsysave <- ggplot(subset_data, aes(x = factor(CardioHealth), y = BPSysAve)) +
  geom_boxplot() +
  labs(title = "Boxplot of BPSysAve by Cardiovascular Health",
       x = "Cardiovascular Health",
       y = "Systolic Blood Pressure")

print(boxplot_bpsysave)

# Histogram of TotChol by CardioHealth
hist_totchol <- ggplot(subset_data, aes(x = TotChol, fill = factor(CardioHealth))) +
  geom_histogram(binwidth = 5, position = "identity", alpha = 0.7) +
  labs(title = "Histogram of Total Cholesterol by Cardiovascular Health",
       x = "Total Cholesterol",
       y = "Count",
       fill = "Cardiovascular Health")

print(hist_totchol)

# Bar plot of TVHrsDay
bar_tvhrsday <- ggplot(subset_data, aes(x = factor(TVHrsDay))) +
  geom_bar() +
  labs(title = "Bar Plot of TVHrsDay",
       x = "TV Hours per Day",
       y = "Count")

print(bar_tvhrsday)

# 6. Data Preview ----------------------------------------------------

# Show the first few rows of updated dataset
cat("\nHead of the subset_data:\n")
print(head(subset_data))

####################################################
# End of final_project_code.R
####################################################

