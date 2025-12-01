#==============================================================================
#  Creating New Variables (Transformations & Calculations)
#  Dataset: Car Sales Data (based on screenshot)
#==============================================================================

library(dplyr)
library(tidyr)

#==============================================================================
# 1. IMPORT & CLEANING
#==============================================================================

df <- read.csv("C:/Users/Priya Gupta/Downloads/car_prices.csv/car_prices.csv", na.strings = c("", "NA"))

# Replace NA numeric fields so calculations do not break
df_clean <- df %>%
  mutate(
    odometer   = replace_na(odometer, 0),
    condition  = replace_na(condition, 0),
    mmr        = replace_na(mmr, 0),
    sellingprice = replace_na(sellingprice, 0)
  )

print("--- Cleaned Data Sample ---")
print(head(df_clean))

#==============================================================================
# 2. METHOD A: ARITHMETIC CALCULATIONS
#==============================================================================

# Scenario: Calculate difference between selling price and MMR value
df_calc <- df_clean %>%
  mutate(
    price_diff = sellingprice - mmr,            # Profit vs MMR
    price_ratio = sellingprice / (mmr + 1)      # Ratio (avoid divide-by-zero)
  )

print("--- Method A Results (Price Calculations) ---")
print(df_calc %>% select(mmr, sellingprice, price_diff, price_ratio))

#==============================================================================
# 3. METHOD B: CONDITIONAL LOGIC
#==============================================================================

# Scenario 1: Condition score label
df_logic <- df_clean %>%
  mutate(
    Condition_Label = ifelse(condition >= 40, "Excellent",
                             ifelse(condition >= 20, "Good", "Fair")),
    
    # Scenario 2: High mileage indicator
    Mileage_Status = ifelse(odometer > 15000, "High Mileage", "Low Mileage")
  )

print("--- Method B Results (Logical Labels) ---")
print(df_logic %>% select(condition, Condition_Label, odometer, Mileage_Status))

#==============================================================================
# 4. METHOD C: TEXT TRANSFORMATION
#==============================================================================

# Scenario: Combine year/make/model into description
df_text <- df_clean %>%
  mutate(
    Car_Description = paste(year, make, model, "with", odometer, "miles"),
    Sale_Info = paste("Sold on", saledate, "for $", sellingprice)
  )

print("--- Method C Results (Descriptions) ---")
print(head(df_text$Car_Description))

#==============================================================================
# 5. FINAL WORKFLOW (ALL VARIABLES TOGETHER)
#==============================================================================

final_dataset <- df_clean %>%
  mutate(
    price_diff = sellingprice - mmr,
    High_Value = ifelse(price_diff > 1000, TRUE, FALSE),
    Summary = paste0(
      make, " ", model, " | Cond: ", condition,
      " | Odo: ", odometer, " | Sold: $", sellingprice
    )
  )

print("--- Final Combined Dataset ---")
print(head(final_dataset))
