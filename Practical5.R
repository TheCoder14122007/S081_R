

library(dplyr)

# Load your dataset
data <- read.csv("C:\\Users\\Priya Gupta\\Downloads\\bank_transactions_data_2.csv",
                 sep = ",", header = TRUE, stringsAsFactors = FALSE)


# Example 1: Sorting by a Single Variable (Ascending)
# Sort by TransactionAmount (lowest to highest)

data_sorted_amount <- data |>
  arrange(TransactionAmount)

head(data_sorted_amount, 5)


# Example 2: Sorting by a Single Variable (Descending)
# Sort by AccountBalance (highest to lowest)

data_sorted_bal_desc <- data |>
  arrange(desc(AccountBalance))

head(data_sorted_bal_desc, 5)


# Example 3: Sorting by Multiple Columns
# Primary: TransactionType (Credit first, then Debit)
# Secondary: TransactionAmount (highest first)

data_multi_sort <- data |>
  arrange(TransactionType, desc(TransactionAmount))

head(data_multi_sort, 10)


# Example 4: Combined Filter + Sort
# Filter: CustomerAge > 50
# Sort: AccountBalance (lowest first)


large_age_low_balance <- data |>
  filter(CustomerAge > 50) |>
  arrange(AccountBalance)

cat("Top 5 older customers with lowest balance:\n")
print(large_age_low_balance |> select(CustomerAge, AccountBalance, TransactionAmount) |> head(5))
