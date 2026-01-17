# -------------------------------
# Logistic Regression using glm()
# -------------------------------

# 1. Read CSV file
filename <- "C:\\Users\\itlab\\Downloads\\hours_scores - hours_scores.csv"
data <- read.csv(filename)


# 2. Check required columns
if (!all(c("Hours", "Scores") %in% colnames(data))) {
  stop("Required columns missing (Hours, Scores)")
}

cat("Header columns:", paste(colnames(data), collapse = ", "), "\n")
cat("Total data rows:", nrow(data), "\n")

# 3. Create binary target variable (Pass / Fail)
data$Pass <- ifelse(data$Scores >= 50, 1, 0)

# View data
head(data)

# 4. Fit Logistic Regression model using glm()
model <- glm(Pass ~ Hours,
             data = data,
             family = binomial(link = "logit"))

# 5. Model summary
summary(model)

# 6. Predict probabilities
data$Predicted_Probability <- predict(model,
                                      newdata = data,
                                      type = "response")

# View predictions
head(data)

# 7. Create prediction curve
sorted_hours <- sort(data$Hours)

pred_curve <- predict(model,
                      newdata = data.frame(Hours = sorted_hours),
                      type = "response")

# 8. Plot Logistic Regression curve
plot(sorted_hours, pred_curve,
     type = "l",
     col = "red",
     lwd = 2,
     ylim = c(0, 1),
     xlab = "Hours Studied",
     ylab = "Probability of Passing",
     main = "Logistic Regression using glm(): Hours vs Pass/Fail")

# Actual Pass/Fail points
points(data$Hours[data$Pass == 1],
       rep(1, sum(data$Pass == 1)),
       col = "blue", pch = 16)

points(data$Hours[data$Pass == 0],
       rep(0, sum(data$Pass == 0)),
       col = "black", pch = 16)

# Legend
legend("right",
       legend = c("Pass", "Fail", "Logistic Curve"),
       col = c("blue", "black", "red"),
       pch = c(16, 16, NA),
       lty = c(NA, NA, 1))
