
# summary() gives basic descriptive statistics
# For numeric data: Min, Q1(Quartiles), Median, Mean, Q3, Max
# For categorical data: count and most frequent values

# describe() gives detailed descriptive statistics
# Includes mean, median, SD, min, max, range, skewness, kurtosis


# Load data set
data <- read.csv("C:\\Users\\itlab\\OneDrive\\Desktop\\S081_Adv.Python\\Practical1\\Cleaned_CollegePlacement.csv")

# Generate descriptive statistics
summary(data)

# Install and load psych package
#install.packages("psych")
library(psych)

# Descriptive statistics
describe(data)


