# ==============================================================================
# 15. Basic Summaries using str() and summary()
# Dataset: Food Delivery Route Efficiency
# ==============================================================================

library(dplyr)

# ==============================================================================
# 1. LOAD YOUR DATA
# ==============================================================================

df <- read.csv(
  "C:\\Users\\itlab\\OneDrive\\Desktop\\S081_R_Studio\\Food_Delivery_Route_Efficiency_Dataset.csv",
  na.strings = c("", "NA")
)

print("--- Data Loaded Successfully ---")

# ==============================================================================
# 2. USING str() → Structure of Dataset
# ==============================================================================

print("--- OUTPUT OF str() ---")
str(df)

# ==============================================================================
# 3. USING summary() → Statistical Summary
# ==============================================================================

print("--- OUTPUT OF summary() [Original] ---")
summary(df)

# ==============================================================================
# 4. IMPROVING SUMMARY USING FACTORS
# Convert character columns to factors for better summary
# ==============================================================================

df$traffic_level <- as.factor(df$traffic_level)
df$delivery_mode <- as.factor(df$delivery_mode)
df$weather <- as.factor(df$weather)
df$restaurant_zone <- as.factor(df$restaurant_zone)
df$customer_zone <- as.factor(df$customer_zone)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(df)

# ==============================================================================
# 5. Specific Summaries (Examples)
# ==============================================================================

avg_delivery_time <- mean(df$delivery_time_min, na.rm = TRUE)
max_distance <- max(df$distance_km, na.rm = TRUE)
min_route_length <- min(df$route_length_km, na.rm = TRUE)

print(paste("Average Delivery Time (min):", avg_delivery_time))
print(paste("Maximum Delivery Distance (km):", max_distance))
print(paste("Minimum Route Length (km):", min_route_length))
