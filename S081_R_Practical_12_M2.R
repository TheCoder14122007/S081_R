# -------------------------------------------------------
# Practical: Correlation Analysis of Student Exam Scores
# -------------------------------------------------------

# Step 0: Install packages (run only once)
# install.packages(c("reshape2", "corrplot"))

# Step 1: Load required libraries
library(ggplot2)
library(reshape2)
library(corrplot)

# Step 2: Load the dataset
data <- read.csv("C:/Users/itlab/OneDrive/Desktop/exam/student_exam_scores.csv")
head(data)

# Step 3: Select numeric columns for correlation
numeric_data <- data[, c("hours_studied", "sleep_hours", "attendance_percent", "previous_scores", "exam_score")]

# Step 4: Generate correlation matrix
cor_matrix <- cor(numeric_data, use = "complete.obs")
print("Correlation Matrix:")
print(cor_matrix)

# Step 5: Upper Triangle Heatmap using ggplot2
# Melt the correlation matrix
melted_cor <- melt(cor_matrix)

# Keep only upper triangle
melted_cor <- melted_cor[as.numeric(melted_cor$Var1) <= as.numeric(melted_cor$Var2), ]

# Plot heatmap
ggplot(melted_cor, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(value, 2)), color = "black", size = 4) + # show correlation values
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0,
                       limit = c(-1,1), space = "Lab", name="Correlation") +
  theme_minimal() +
  labs(title = "Upper Triangle Correlation Heatmap") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))

# Step 6: Correlogram using corrplot
corrplot(cor_matrix, method = "circle", type = "upper", tl.col = "black", tl.srt = 45,
         addCoef.col = "black", number.cex = 0.8, title = "Correlogram")
