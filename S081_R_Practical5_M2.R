# -----------------------------------------
# AIM:
# Perform independent two-sample t-tests
# to check whether the means of a numeric variable
# are significantly different between two groups
# -----------------------------------------

# Load dataset
data <- read.csv("C:\\Users\\itlab\\Downloads\\AI_Impact_on_Jobs_2030.csv")

# Check structure of dataset
str(data)

# Ensure numeric column is numeric
data$Average_Salary <- as.numeric(data$Average_Salary)

# Check the groups
table(data$Risk_Category)

# Example: Compare Average_Salary between "High" vs "Low" risk categories
# Subset data for only these two groups
subset_data <- data[data$Risk_Category %in% c("High", "Low"), ]

# Perform independent two-sample t-test
t_test_result <- t.test(Average_Salary ~ Risk_Category,
                        data = subset_data,
                        var.equal = FALSE)  # Welch t-test (does not assume equal variance)

# Display the result
t_test_result

# -----------------------------------------
# INTERPRETATION:
# If p-value < 0.05 -> Reject H0 (means are significantly different)
# If p-value >= 0.05 -> Fail to reject H0 (no significant difference)
# -----------------------------------------
