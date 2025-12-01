# ==============================================================================
# R Script: Handling Missing Values (Data Cleaning)
# Dataset: Titanic Passenger Data
# ==============================================================================

# Load libraries
#install.packages("tidyr")
library(dplyr)
library(tidyr)

# ==============================================================================
# 1. IMPORT DATA
# ==============================================================================

# Treat blank cells or "NA" as missing
titanic_df <- read.csv("C:/Users/Priya Gupta/Downloads/S081 Priya Rakesh Gupta - titanic.csv", na.strings = c("", "NA"))

cat("\n--- 1. Original Data (First 6 Rows) ---\n")
print(head(titanic_df))

# Count missing values
cat("\n--- Count of Missing Values per Column ---\n")
print(colSums(is.na(titanic_df)))

# ==============================================================================
# 2. METHOD A: REMOVE ALL ROWS WITH ANY MISSING VALUE
# ==============================================================================

clean_omit <- na.omit(titanic_df)

cat("\n--- 2. Data after na.omit() ---\n")
cat("Original rows:", nrow(titanic_df), "\n")
cat("Rows remaining:", nrow(clean_omit), "\n")
print(head(clean_omit))

# ==============================================================================
# 3. METHOD B: FILL MISSING VALUES (replace_na)
# ==============================================================================

# Strategy for replacement:
#  - Age       → Replace missing ages with mean age
#  - Cabin     → Replace missing cabin with "Unknown"
#  - Embarked  → Replace missing with most common value ("S")
#  - Fare      → Replace missing with mean fare

avg_age  <- mean(titanic_df$Age, na.rm = TRUE)
avg_fare <- mean(titanic_df$Fare, na.rm = TRUE)

# Find most common Embarked value
most_common_embarked <- names(sort(table(titanic_df$Embarked), decreasing = TRUE))[1]

clean_replace <- titanic_df %>%
  replace_na(list(
    Age      = avg_age,
    Cabin    = "Unknown",
    Embarked = most_common_embarked,
    Fare     = avg_fare
  ))

cat("\n--- 3. Data after replace_na() ---\n")
print(head(clean_replace))

cat("\n--- Remaining NAs After Cleanup ---\n")
print(colSums(is.na(clean_replace)))
