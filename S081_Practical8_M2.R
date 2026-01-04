# Load dataset
df <- read.csv("C:/Users/Priya Gupta/Downloads/heart.csv")

# Convert categorical variables
df$Sex <- as.factor(df$Sex)
df$ChestPainType <- as.factor(df$ChestPainType)

# Fit Two-way ANOVA
anova2_model <- aov(Cholesterol ~ Sex * ChestPainType, data = df)
summary(anova2_model)

# Check residual normality
res2 <- residuals(anova2_model)
shapiro.test(res2)

# Check homogeneity of variance
library(car)
leveneTest(Cholesterol ~ Sex * ChestPainType, data = df)

# Post-hoc test
TukeyHSD(anova2_model, "ChestPainType")

# Load required libraries
library(ggplot2)
library(dplyr)

# Interaction plot data (mean cholesterol)
interaction_data <- df %>%
  group_by(ChestPainType, Sex) %>%
  summarise(mean_chol = mean(Cholesterol, na.rm = TRUE))

# -------------------------------
# 1️⃣ Interaction Plot (ggplot)
# -------------------------------
ggplot(interaction_data,
       aes(x = ChestPainType,
           y = mean_chol,
           group = Sex,
           color = Sex)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Interaction Plot: Sex and Chest Pain Type on Cholesterol",
    x = "Chest Pain Type",
    y = "Mean Cholesterol"
  ) +
  theme_minimal(base_size = 14)

# -------------------------------
# 2️⃣ Boxplot (ggplot)
# -------------------------------
ggplot(df,
       aes(x = ChestPainType,
           y = Cholesterol,
           fill = Sex)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Boxplot of Cholesterol by Chest Pain Type and Sex",
    x = "Chest Pain Type",
    y = "Cholesterol"
  ) +
  theme_minimal(base_size = 14)
