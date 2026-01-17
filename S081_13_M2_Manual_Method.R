# ================================
# Linear Regression in R
# ================================

# Load required libraries
library(ggplot2)

# Read CSV file
data <- read.csv("C:/Users/itlab/Downloads/Song.csv")

# Convert required columns to numeric
# Column index 7 = playlist, 9 = streams (Scala cols.lift(6) & lift(8))
data$playlist <- as.numeric(data[, 7])
data$streams  <- as.numeric(data[, 9])

# Remove rows with NA values
filteredData <- na.omit(data[, c("playlist", "streams")])

# Check if data exists
if (nrow(filteredData) == 0) {
  stop("No valid numeric data found in the specified columns.")
}

# Extract variables
x <- filteredData$playlist
y <- filteredData$streams / 1e6   # Streams in millions (same as Scala)

# ================================
# Manual Linear Regression (Matrix Method)
# ================================

# Create design matrix
X <- cbind(1, x)

# Beta = (X'X)^-1 X'Y
beta <- solve(t(X) %*% X) %*% t(X) %*% y

intercept <- beta[1]
slope <- beta[2]

cat("Intercept:", intercept, "\n")
cat("Slope:", slope, "\n")

# Predicted values
yPred <- X %*% beta

# Residuals
residuals <- y - yPred

# R-squared calculation
ssRes <- sum(residuals^2)
ssTot <- sum((y - mean(y))^2)
rSquared <- 1 - (ssRes / ssTot)

cat(sprintf("R-squared: %.4f\n", rSquared))

# ================================
# Prediction
# ================================

newX <- 2000
predicted <- intercept + slope * newX
cat(sprintf("Predicted streams (in millions) for %d playlists: %.2f\n",
            newX, predicted))

# ================================
# Plot
# ================================

ggplot(filteredData, aes(x = playlist, y = streams / 1e6)) +
  geom_point(color = "blue", shape = 3) +
  geom_abline(intercept = intercept, slope = slope, color = "red") +
  labs(
    title = "Linear Regression Plot",
    x = "Number of Playlists",
    y = "Streams (in millions)"
  ) +
  theme_minimal()
