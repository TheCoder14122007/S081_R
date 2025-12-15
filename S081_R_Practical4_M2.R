# -----------------------------------------
# AIM:
# Perform a one-sample t-test to check
# whether the mean of a sample is significantly
# different from a given value (hypothesized mean)
# -----------------------------------------

# Load dataset
data <- read.csv("C:\\Users\\itlab\\Downloads\\AI_Impact_on_Jobs_2030.csv")

# Check structure of dataset
str(data)

# Choose a numeric column for the t-test
# Example: Average_Salary
# Ensure it is numeric
data$Average_Salary <- as.numeric(data$Average_Salary)

# Check summary
summary(data$Average_Salary)

# Perform one-sample t-test
# Hypothesized mean (mu) = 100000 (example, adjust as needed)
t_test_result <- t.test(data$Average_Salary,
                        mu = 100000,
                        na.rm = TRUE)

# Display the t-test result
t_test_result

# -----------------------------------------
# INTERPRETATION:
# If p-value < 0.05 -> Reject H0 (sample mean is significantly different from 100000)
# If p-value >= 0.05 -> Fail to reject H0 (sample mean is NOT significantly different from 100000)
# -----------------------------------------
