# -----------------------------------------
# AIM:
# Perform paired t-test to compare means of two paired numeric variables
# -----------------------------------------

# Load dataset
data <- read.csv("C:\\Users\\itlab\\Downloads\\AI_Impact_on_Jobs_2030.csv")

# Check structure
str(data)

# Ensure the numeric columns are numeric
data$AI_Exposure_Index <- as.numeric(data$AI_Exposure_Index)
data$Automation_Probability_2030 <- as.numeric(data$Automation_Probability_2030)

# Perform paired t-test
paired_test_result <- t.test(data$AI_Exposure_Index,
                             data$Automation_Probability_2030,
                             paired = TRUE)

# Display result
paired_test_result

# -----------------------------------------
# INTERPRETATION:
# If p-value < 0.05 -> Reject H0 (the means of the two variables are significantly different)
# If p-value >= 0.05 -> Fail to reject H0 (no significant difference between means)
# -----------------------------------------
