# -------------------------------
# Read CSV file
# -------------------------------
filename <- "C:\\Users\\itlab\\Downloads\\hours_scores - hours_scores.csv"
data <- read.csv(filename)

# Check required columns
if (!all(c("Hours", "Scores") %in% colnames(data))) {
  stop("Required columns missing (Hours, Scores)")
}

cat("Header columns:", paste(colnames(data), collapse = ", "), "\n")
cat("Total data rows:", nrow(data), "\n")

# -------------------------------
# Create binary label (Pass / Fail)
# -------------------------------
data$Pass <- ifelse(data$Scores >= 50, 1, 0)

# -------------------------------
# Feature normalization
# -------------------------------
hours <- data$Hours
mean_hours <- mean(hours)
std_hours <- sd(hours)

hours_norm <- (hours - mean_hours) / std_hours

# -------------------------------
# Design matrix (Bias + Feature)
# -------------------------------
X <- cbind(1, hours_norm)
y <- data$Pass
m <- length(y)

# -------------------------------
# Sigmoid function
# -------------------------------
sigmoid <- function(z) {
  1 / (1 + exp(-z))
}

# -------------------------------
# Gradient Descent for Logistic Regression
# -------------------------------
alpha <- 0.1
iterations <- 5000
theta <- rep(0, ncol(X))

for (i in 1:iterations) {
  z <- X %*% theta
  predictions <- sigmoid(z)
  error <- predictions - y
  gradient <- (t(X) %*% error) / m
  theta <- theta - alpha * gradient
  
  if (i %% 500 == 0) {
    cost <- (-t(y) %*% log(predictions) -
               t(1 - y) %*% log(1 - predictions)) / m
    cat(sprintf("Iteration %d: Cost = %.4f\n", i, cost))
  }
}

cat("Trained Parameters (theta):\n")
print(theta)

# -------------------------------
# Prediction curve
# -------------------------------
sorted_hours <- sort(hours)
norm_sorted <- (sorted_hours - mean_hours) / std_hours
X_plot <- cbind(1, norm_sorted)
predictions_plot <- sigmoid(X_plot %*% theta)

# -------------------------------
# Plotting
# -------------------------------
pass_hours <- data$Hours[data$Pass == 1]
fail_hours <- data$Hours[data$Pass == 0]

plot(sorted_hours, predictions_plot,
     type = "l",
     col = "red",
     lwd = 2,
     ylim = c(0, 1),
     xlab = "Hours Studied",
     ylab = "Probability of Passing",
     main = "Logistic Regression: Hours -> Pass/Fail")

points(pass_hours, rep(1, length(pass_hours)),
       col = "blue", pch = 16)
points(fail_hours, rep(0, length(fail_hours)),
       col = "black", pch = 16)

legend("right",
       legend = c("Pass", "Fail", "Logistic Curve"),
       col = c("blue", "black", "red"),
       pch = c(16, 16, NA),
       lty = c(NA, NA, 1))
