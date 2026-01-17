# ================================
# Linear Regression using lm()
# ================================

# Load required library
library(ggplot2)

# Read CSV file
Song <- read.csv("C:/Users/itlab/Downloads/Song.csv",
                 fileEncoding = "ISO-8859-1")

# Convert required columns to numeric
# Column 7 = Number of Playlists
# Column 9 = Streams
Song$playlist <- as.numeric(Song[, 7])
Song$streams  <- as.numeric(Song[, 9])

# Remove missing values
Song <- na.omit(Song)

# Convert streams into millions
Song$streams_million <- Song$streams / 1e6

# ================================
# Linear Regression Model using lm()
# ================================

model <- lm(streams_million ~ playlist, data = Song)

# Display model summary
summary(model)

# ================================
# Prediction
# ================================

newdata <- data.frame(playlist = 2000)
predicted_value <- predict(model, newdata)

cat("Predicted streams (in millions) for 2000 playlists:",
    predicted_value, "\n")

# ================================
# Plot
# ================================

ggplot(Song, aes(x = playlist, y = streams_million)) +
  geom_point(color = "blue", shape = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Linear Regression Analysis using lm()",
    x = "Number of Playlists",
    y = "Streams (in millions)"
  ) +
  theme_minimal()
