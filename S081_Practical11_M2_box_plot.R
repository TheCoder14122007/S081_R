# Load library
library(ggplot2)

# Read dataset
df <- read.csv("C:\\Users\\Priya Gupta\\Downloads\\StudentPerformanceFactors.csv")

ggplot(df, aes(x = Gender, y = Exam_Score)) +
  
  # Main boxplot
  geom_boxplot(fill = "lightblue", color = "black") +
  
  # Median line ko thoda highlight karna
  stat_summary(fun = median, geom = "point",
               color = "red", size = 3) +
  
  labs(
    title = "Box Plot of Exam Scores by Gender",
    subtitle = "Shows median, spread (IQR), and extreme values",
    x = "Gender",
    y = "Exam Score"
  ) +
  
  theme_minimal()

