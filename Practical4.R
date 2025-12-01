# 1 Load Dataset

cars <- read.csv("C:\\Users\\Priya Gupta\\Downloads\\car_prices.csv\\car_prices.csv",
                 sep = ",", header = TRUE, stringsAsFactors = FALSE)



# 2 Basic Exploration

head(cars)
tail(cars)
dim(cars)
cat("Dimensions (rows, columns): ", dim(cars), "\n")

str(cars)
summary(cars)
names(cars)



# 3️ Base R Subsetting Examples

# Cars with odometer < 20,000
low_mileage <- subset(cars, odometer < 20000)
cat("Cars with low mileage (< 20,000):", nrow(low_mileage), "\n")
head(low_mileage)

# White cars AND condition >= 4
white_good <- subset(cars, color == "white" & condition >= 4)
cat("White cars with condition >= 4:", nrow(white_good), "\n")
head(white_good)

# Cars from CA OR trim LX
ca_or_lx <- subset(cars, state == "ca" | trim == "LX")
cat("Cars from CA or trim LX:", nrow(ca_or_lx), "\n")
head(ca_or_lx)


# 4️ dplyr Subsetting Examples

if(!require(dplyr)) install.packages("dplyr")
library(dplyr)

# Selling price > 20,000
high_price <- cars %>% filter(sellingprice > 20000)
cat("Cars with selling price > 20,000:", nrow(high_price), "\n")
head(high_price)

# SUV body AND automatic transmission
suv_auto <- cars %>% filter(body == "SUV", transmission == "automatic")
cat("SUV + Auto transmission:", nrow(suv_auto), "\n")
head(suv_auto)

# State CA or NY
ca_ny <- cars %>% filter(state %in% c("ca", "ny"))
cat("Cars from CA or NY:", nrow(ca_ny), "\n")
table(ca_ny$state)

# Cars sold above MMR
above_mmr <- cars %>% filter(sellingprice > mmr)
cat("Cars sold above MMR:", nrow(above_mmr), "\n")
head(above_mmr)


# 5️ Frequency Tables

table(cars$make)
table(cars$state)
table(cars$body)
table(cars$color)


# 6️ Correct Date Conversion
# Remove timezone in brackets (e.g., (PST))
cars$saledate_clean <- sub("\\s*\\([^)]*\\)", "", cars$saledate)

# Convert into POSIXct
cars$saledate_parsed <- as.POSIXct(
  cars$saledate_clean,
  format = "%a %b %d %Y %H:%M:%S GMT%z"
)

# Check result
head(cars$saledate_parsed)
str(cars$saledate_parsed)


