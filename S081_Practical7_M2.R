# Load data
df <- read.csv("C:/Users/Priya Gupta/Downloads/fetal_health.csv")
head(df)
str(df)

# Convert fetal_health to factor
df$fetal_health <- as.factor(df$fetal_health)
str(df$fetal_health)

# Check ANOVA assumptions
anova_model <- aov(baseline_value ~ fetal_health, data = df)

# Normality of residuals
res <- residuals(anova_model)
shapiro.test(res)

# Homogeneity of variance
#install.packages("car")
library(car)
leveneTest(baseline_value ~ fetal_health, data = df)

# Perform ANOVA
summary(anova_model)

# Post-hoc analysis
TukeyHSD(anova_model)

# Enhanced ggplot boxplot
#install.packages("ggplot2")
library(ggplot2)
ggplot(df, aes(x = fetal_health, y = baseline_value, fill = fetal_health)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Baseline Value by Fetal Health Category",
       x = "Fetal Health", y = "Baseline Value") +
  scale_fill_brewer(palette = "Pastel1")
