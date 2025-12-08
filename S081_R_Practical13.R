# ==============================================================================
# R Script: Identifying and Handling Duplicates (Food Delivery Dataset)
# ==============================================================================

library(dplyr)

# ==============================================================================
# 1. IMPORT FOOD DELIVERY DATASET
# ==============================================================================
df <- read.csv(
  "C:\\Users\\itlab\\OneDrive\\Desktop\\S081_R_Studio\\Duplicate_Food_Delivery_Route_Efficiency_Dataset.csv",
  na.strings = c("", "NA")
)

print("--- 1. Original Dataset ---")
print(head(df))
print(paste("Total Rows:", nrow(df)))

# ==============================================================================
# 2. IDENTIFY EXACT DUPLICATE ROWS
# ==============================================================================
# Any rows where EVERY column is the same

duplicate_rows <- df %>%
  group_by(across(everything())) %>%  
  filter(n() > 1)

print("--- 2. Exact Duplicate Rows (if any) ---")
print(duplicate_rows)

# ==============================================================================
# 3. REMOVE EXACT DUPLICATES
# ==============================================================================
df_no_duplicates <- df %>% distinct()

print("--- 3. Dataset After Removing Exact Duplicates ---")
print(head(df_no_duplicates))
print(paste("Rows After Removing Exact Duplicates:", nrow(df_no_duplicates)))

# ==============================================================================
# 4. REMOVE DUPLICATES BASED ON A SPECIFIC COLUMN
# Example: Keep only 1 row per order_id (First occurrence kept)
# ==============================================================================
unique_orders <- df %>% distinct(order_id, .keep_all = TRUE)

print("--- 4. Unique Orders Only (Duplicate order_id removed) ---")
print(head(unique_orders))
print(paste("Unique Orders Count:", nrow(unique_orders)))

# ==============================================================================
# 5. REMOVE DUPLICATES BASED ON MULTIPLE COLUMNS
# Example: order_id + distance_km
# ==============================================================================
unique_routes <- df %>% distinct(order_id, distance_km, .keep_all = TRUE)

print("--- 5. Unique Combination: order_id + distance_km ---")
print(head(unique_routes))
