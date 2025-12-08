# ==============================================================================
# VERTICAL CONCATENATION USING rbind()
# Datasets: iris (built-in) + flower_dataset.csv (custom)
# ==============================================================================

library(dplyr)

# ------------------------------------------------------------------------------
# 1. LOAD DATA
# ------------------------------------------------------------------------------

data(iris)  # built-in dataset

flower_df <- read.csv("C:\\Users\\itlab\\Downloads\\flower_dataset - flower_dataset.csv")

cat("--- Original Column Names ---\n")
print(names(iris))
print(names(flower_df))

# ------------------------------------------------------------------------------
# 2. PREPARE DATA (Make columns same before rbind)
# Common column structure → Species + Height
# ------------------------------------------------------------------------------

# 2.1 Iris → Use Sepal.Length as example height
iris_clean <- iris %>%
  select(Species, Sepal.Length) %>%
  rename(Height = Sepal.Length)

# 2.2 Flower dataset → pick matching columns
flower_clean <- flower_df %>%
  select(species, height_cm) %>%
  rename(Species = species,
         Height = height_cm)

# Ensure numeric height
iris_clean$Height   <- as.numeric(iris_clean$Height)
flower_clean$Height <- as.numeric(flower_clean$Height)

# ------------------------------------------------------------------------------
# 3. VERTICAL CONCATENATION (Stack rows)
# ------------------------------------------------------------------------------

combined_data <- rbind(iris_clean, flower_clean)

cat("\n--- Combined Data Summary ---\n")
cat("Iris rows:     ", nrow(iris_clean), "\n")
cat("Flower rows:   ", nrow(flower_clean), "\n")
cat("Total Expected:", nrow(iris_clean) + nrow(flower_clean), "\n")
cat("Total Actual:  ", nrow(combined_data), "\n\n")

cat("--- Preview of Combined Data ---\n")
print(head(combined_data))
print(tail(combined_data))
