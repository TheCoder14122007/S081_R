# -------------------------------
# Load required libraries
# -------------------------------
# install.packages(c("ggplot2", "dplyr"))  # run only once if not installed

library(ggplot2)
library(dplyr)

# -------------------------------
# Read CSV file
# -------------------------------
df <- read.csv("C:\\Users\\itlab\\Downloads\\retail_sales_dataset.csv")

# -------------------------------
# View dataset
# -------------------------------
str(df)
head(df)

# =========================================================
# GRAPH 1: SCATTER PLOT
# Quantity vs Total Amount
# =========================================================
print("Graph 1: Scatter Plot")

ggplot(df, aes(x = Quantity, y = Total.Amount)) +
  geom_point(color = "blue", size = 3) +
  labs(
    title = "Scatter Plot: Quantity vs Total Amount",
    x = "Quantity Purchased",
    y = "Total Amount"
  ) +
  theme_minimal()

# =========================================================
# GRAPH 2: PIE CHART
# Product Category Distribution
# =========================================================

print("GRAPH 2: PIE CHART")

product_data <- df %>%
  count(Product.Category)

print("Graph 2: Pie Chart")

ggplot(product_data, aes(x = "", y = n, fill = Product.Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Pie Chart: Product Category Distribution") +
  theme_void()

# =========================================================
# GRAPH 3: HIGH–LOW CHART
# Sales Variation by Date
# =========================================================

print("GRAPH 3: HIGH–LOW CHART")

hl_data <- df %>%
  group_by(Date) %>%
  summarise(
    High = max(Total.Amount, na.rm = TRUE),
    Low  = min(Total.Amount, na.rm = TRUE)
  )

print("Graph 3: High–Low Chart")

ggplot(hl_data, aes(x = Date)) +
  geom_linerange(
    aes(ymin = Low, ymax = High),
    color = "pink",
    size = 2
  ) +
  labs(
    title = "High–Low Chart: Sales Variation",
    x = "Date",
    y = "Total Amount"
  ) +
  theme_minimal()
