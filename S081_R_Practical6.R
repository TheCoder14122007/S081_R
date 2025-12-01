# Practical  6: Merge and Append

#install.packages("dplyr")
library(dplyr)

# Create data sets
data_jan <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Alice", "Bob", "Charlie"),
  Jan_Sales = c(100, 150, 200)
)

data_feb <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Alice", "Bob", "Charlie"),
  Feb_Sales = c(120, 160, 210)
)

data_new_hires <- data.frame(
  ID = c(4, 5),
  Name = c("David", "Eva"),
  Jan_Sales = c(50, 60)
)

print("--- Data January ---")
print(data_jan)

print("--- Data February ---")
print(data_feb)

# Merge data sets (add columns)
merged_data <- merge(data_jan, data_feb, by = c("ID", "Name"))
print("--- Merged Data ---")
print(merged_data)

# Append data sets (add rows)
final_list <- bind_rows(data_jan, data_new_hires)
print("--- Appended Data ---")
print(final_list)

#============================================== With uploaded Data sets==================================================


# PRACT-6 : MERGE + APPEND on Your Data sets with Data sets

library(dplyr)

# ------------------------------------------
# 1. LOAD BOTH DATASETS
# ------------------------------------------
data1 <- read.csv("C:/Users/itlab/OneDrive/Desktop/S081_R_Studio/study_performance.csv")
data2 <- read.csv("C:\\Users\\itlab\\OneDrive\\Desktop\\S081_R_Studio\\study_performance_predition.csv")

cat("\n===== DATASET 1 STRUCTURE =====\n")
str(data1)

cat("\n===== DATASET 2 STRUCTURE =====\n")
str(data2)

cat("\n===== DATASET 1 COLUMNS =====\n")
print(names(data1))

cat("\n===== DATASET 2 COLUMNS =====\n")
print(names(data2))


# ------------------------------------------
# 2. FIND COMMON COLUMNS
# ------------------------------------------
common_cols <- intersect(names(data1), names(data2))

cat("\n===== COMMON COLUMNS =====\n")
print(common_cols)


# ------------------------------------------
# 3. DIFFERENT TYPES OF MERGE
# ------------------------------------------

# 1 INNER JOIN (only matching rows)
inner_merge <- merge(data1, data2, by = common_cols)

# 2️ LEFT JOIN (all rows from data1)
left_merge <- merge(data1, data2, by = common_cols, all.x = TRUE)

# 3️ RIGHT JOIN (all rows from data2)
right_merge <- merge(data1, data2, by = common_cols, all.y = TRUE)

# 4️ FULL OUTER JOIN (all rows from both datasets)
full_merge <- merge(data1, data2, by = common_cols, all = TRUE)


# ------------------------------------------
# 4. APPEND (STACK ROWS)
# ------------------------------------------
appended_data <- bind_rows(data1, data2)


# ------------------------------------------
# 5. PRINT PREVIEWS
# ------------------------------------------

cat("\n===== INNER MERGE PREVIEW =====\n")
print(head(inner_merge))

cat("\n===== LEFT MERGE PREVIEW =====\n")
print(head(left_merge))

cat("\n===== RIGHT MERGE PREVIEW =====\n")
print(head(right_merge))

cat("\n===== FULL MERGE PREVIEW =====\n")
print(head(full_merge))

cat("\n===== APPENDED DATA PREVIEW =====\n")
print(head(appended_data))
