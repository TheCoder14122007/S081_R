# ==============================================================================
# R Script: Extracting Date & Time Components using lubridate
# Dataset: Food_Delivery_Route_Efficiency_Dataset.csv
# ==============================================================================

# Install if needed
 install.packages("lubridate")

library(lubridate)
library(dplyr)

# ==============================================================================
# 1. IMPORT FOOD DELIVERY DATA
# ==============================================================================

df <- read.csv(
  "C:\\Users\\itlab\\OneDrive\\Desktop\\S081_R_Studio\\Food_Delivery_Route_Efficiency_Dataset.csv",
  na.strings = c("", "NA")
)

print("--- Original Dataset Preview ---")
print(head(df))

# ==============================================================================
# 2. PARSE DATE-TIME (order_time) AND EXTRACT COMPONENTS
# ==============================================================================

processed_data <- df %>%
  mutate(
    # Convert character → POSIX date-time
    Actual_DateTime = ymd_hm(order_time),
    
    # Extract Components
    Year = year(Actual_DateTime),
    Month_Number = month(Actual_DateTime),
    Month_Name = month(Actual_DateTime, label = TRUE),
    
    Day = day(Actual_DateTime),
    Weekday_Number = wday(Actual_DateTime),
    Weekday_Name = wday(Actual_DateTime, label = TRUE, abbr = FALSE),
    
    Hour = hour(Actual_DateTime),
    Minute = minute(Actual_DateTime),
    
    Quarter = quarter(Actual_DateTime),
    Day_of_Year = yday(Actual_DateTime)
  )

print("--- Extracted Date-Time Components ---")
print(head(processed_data))
# ==============================================================================

# ==============================================================================
# 3. SYSTEM DATE-TIME EXTRACTION (NOW)
# ==============================================================================

current_time <- now()

print("--- Current Time Extraction ---")
print(paste("Current Year:", year(current_time)))
print(paste("Current Month:", month(current_time)))
print(paste("Current Day:", day(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))
