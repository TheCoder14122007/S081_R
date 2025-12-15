#R Code (Using table())
# Load dataset
data <- read.csv("C:\\Users\\itlab\\Downloads\\Heart_disease_statlog.csv")

# Frequency table for target variable
table(data$target)

# Frequency table for gender
table(data$sex)

# Frequency table for chest pain type
table(data$cp)

#_________________________________________________________________________________________________________________________________________________________________________

#R Code (Using count() from dplyr)
# Install and load dplyr package
#install.packages("dplyr")
library(dplyr)

# Frequency count using count()
count(data, target)
count(data, sex)
count(data, cp)
