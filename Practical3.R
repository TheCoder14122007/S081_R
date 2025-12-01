install.packages(c("readr", "psych"))
library(readr)
library(psych)

head(bank_transactions_data_2)
tail(bank_transactions_data_2)
dim(bank_transactions_data_2)
cat("Dimensions (Rows, Columns): ", dim(bank_transactions_data_2), "\n")

str(bank_transactions_data_2)
summary(bank_transactions_data_2)
names(bank_transactions_data_2)
cat("Column Names: ", names(bank_transactions_data_2), "\n")
describe(bank_transactions_data_2)


head(XAU_15m_data)
tail(XAU_15m_data)
dim(XAU_15m_data)
cat("Dimensions (Rows, Columns): ", dim(XAU_15m_data), "\n")

str(XAU_15m_data)
summary(XAU_15m_data)
names(XAU_15m_data)
cat("Column Names: ", names(XAU_15m_data), "\n")
describe(XAU_15m_data)
