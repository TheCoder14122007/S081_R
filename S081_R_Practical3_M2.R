
# Cross-tabulation (Two-way table):
# Used to compare two categorical variables together
# Shows how many times each combination of values occurs
# Example: Male/Female vs Heart Disease (Yes/No)



# Load dataset
data <- read.csv("C:\\Users\\itlab\\Downloads\\Heart_disease_statlog.csv")

# Create two-way table (cross-tabulation)
cross_tab <- table(data$sex, data$target)

# Display table
cross_tab
