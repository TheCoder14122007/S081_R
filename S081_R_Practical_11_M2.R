# Step 1: Load the data and packages
print("Step 1: Load the data and packages")

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("C:/Users/itlab/OneDrive/Desktop/exam/student_exam_scores.csv")

# View the first few rows
print("Step 1a: Preview of the dataset")
head(data)

# Step 2: Histogram of Hours Studied
print("Step 2: Histogram of Hours Studied")
ggplot(data, aes(x = hours_studied)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Hours Studied", x = "Hours Studied", y = "Count") +
  theme_minimal()

# Step 3: Histogram of Sleep Hours
print("Step 3: Histogram of Sleep Hours")
ggplot(data, aes(x = sleep_hours)) +
  geom_histogram(binwidth = 1, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of Sleep Hours", x = "Sleep Hours", y = "Count") +
  theme_minimal()

# Step 4: Histogram of Attendance Percentage
print("Step 4: Histogram of Attendance Percentage")
ggplot(data, aes(x = attendance_percent)) +
  geom_histogram(binwidth = 5, fill = "salmon", color = "black") +
  labs(title = "Distribution of Attendance Percentage", x = "Attendance (%)", y = "Count") +
  theme_minimal()

# Step 5: Histogram of Previous Scores
print("Step 5: Histogram of Previous Scores")
ggplot(data, aes(x = previous_scores)) +
  geom_histogram(binwidth = 5, fill = "violet", color = "black") +
  labs(title = "Distribution of Previous Scores", x = "Previous Scores", y = "Count") +
  theme_minimal()

# Step 6: Histogram of Exam Scores
print("Step 6: Histogram of Exam Scores")
ggplot(data, aes(x = exam_score)) +
  geom_histogram(binwidth = 5, fill = "gold", color = "black") +
  labs(title = "Distribution of Exam Scores", x = "Exam Score", y = "Count") +
  theme_minimal()

# Step 7: Boxplot of Exam Scores by Attendance Percentage (grouped in 10% bins)
print("Step 7: Boxplot of Exam Scores by Attendance Percentage")
data <- data %>%
  mutate(attendance_bin = cut(attendance_percent, breaks = seq(0, 100, 10), right = FALSE))

ggplot(data, aes(x = attendance_bin, y = exam_score)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Exam Scores by Attendance Percentage", x = "Attendance (%) Bin", y = "Exam Score") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Step 8: Boxplot of Exam Scores by Hours Studied (grouped in 2-hour bins)
print("Step 8: Boxplot of Exam Scores by Hours Studied")
data <- data %>%
  mutate(hours_bin = cut(hours_studied, breaks = seq(0, max(hours_studied)+2, 2), right = FALSE))

ggplot(data, aes(x = hours_bin, y = exam_score)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Exam Scores by Hours Studied", x = "Hours Studied Bin", y = "Exam Score") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
