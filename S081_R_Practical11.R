
# ==============================================================================
# R Script: Reshaping Data with pivot_longer() and pivot_wider()
# Dataset: Food_Delivery_Route_Efficiency_Dataset.csv
# ==============================================================================

#install.packages("tidyr")
library(dplyr)
library(tidyr)

# ==============================================================================
# 1. IMPORT DATA
# ==============================================================================

df <- read.csv(
  "C:\\Users\\itlab\\OneDrive\\Desktop\\S081_R_Studio\\Food_Delivery_Route_Efficiency_Dataset.csv",
  na.strings = c("", "NA")
) %>%
  mutate(RecordID = row_number())  # unique row ID

print("--- 1. Original Data ---")
print(head(df))

# ==============================================================================
# 2. SELECT NUMERIC COLUMNS FOR RESHAPING
# (Columns that exist in your dataset)
# ==============================================================================

df_small <- df %>%
  select(RecordID, distance_km, delivery_time_min, route_length_km)

print("--- 1A. Selected Wide Data ---")
print(head(df_small))

# ==============================================================================
# 3. PIVOT_LONGER (Wide → Long)
# ==============================================================================

long_df <- df_small %>%
  pivot_longer(
    cols = c(distance_km, delivery_time_min, route_length_km),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format ---")
print(head(long_df, 12))

# ==============================================================================
# 4. PIVOT_WIDER (Long → Wide)
# ==============================================================================

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))

# ==============================================================================
# 5. ADVANCED PIVOT (Spread traffic_level as columns)
# ==============================================================================

df_clean <- df %>%
  mutate(traffic_level = ifelse(is.na(traffic_level), "Unknown", traffic_level))

traffic_pivot <- df_clean %>%
  select(RecordID, traffic_level, delivery_time_min) %>%
  pivot_wider(
    names_from = traffic_level,
    values_from = delivery_time_min
  )

print("--- 4. Traffic Level Pivot Table ---")
print(head(traffic_pivot))
