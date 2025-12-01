# ==============================================================================
# 1. IMPORT DATASET
# ==============================================================================
library(dplyr)  # The select() function is available inside the dplyr package

# Import your CSV file
student <- read.csv("C:/Users/itlab/OneDrive/Desktop/S081_R_Studio/StudentPerformanceFactors.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(student, 3))


# ==============================================================================
# 2. SELECTING VARIABLES (Keeping Columns)
# ==============================================================================

# Method A: Select specific columns by their names
# Scenario: We want to keep only Hours_Studied, Attendance, and Exam_Score
selected_cols <- student %>%
  select(Hours_Studied, Attendance, Exam_Score)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))


# Method B: Select a continuous range of adjacent columns
# Scenario: Select from the first column to the 5th column
# Example: Selecting columns from Hours_Studied to Extracurricular_Activities
range_cols <- student %>%
  select(Hours_Studied:Extracurricular_Activities)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))


# Method C: Select using helper functions (starts_with)
# Scenario: Select all columns that start with the letter "P"
# Example: Parental_Involvement, Previous_Scores, Physical_Activity, etc.
starts_with_p <- student %>%
  select(starts_with("P"))

print("--- Selected columns starting with 'P' ---")
print(head(starts_with_p, 3))


# ==============================================================================
# 3. DROPPING VARIABLES (Removing Columns)
# ==============================================================================

# Method A: Drop a single specific column
# Scenario: Remove the column 'Gender'
dropped_one <- student %>%
  select(-Gender)

print("--- Dataset with 'Gender' dropped ---")
print(names(dropped_one))   # Checking if it is removed


# Method B: Drop multiple columns at once
# Scenario: Remove 'School_Type' and 'Peer_Influence'
dropped_multiple <- student %>%
  select(-School_Type, -Peer_Influence)

print("--- Dataset with 'School_Type' and 'Peer_Influence' dropped ---")
print(names(dropped_multiple))


# Method C: Drop a range of columns
# Scenario: Remove all columns from Sleep_Hours to Family_Income
dropped_range <- student %>%
  select(-(Sleep_Hours:Family_Income))

print("--- Dataset with range 'Sleep_Hours' to 'Family_Income' dropped ---")
print(names(dropped_range))
