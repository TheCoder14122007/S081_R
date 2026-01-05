# ================================
# STEP 1: Load Dataset
# ================================
df <- read.csv("C:/Users/itlab/Downloads/covid19_patient_symptoms_diagnosis.csv")

# Check structure
str(df)

# ================================
# STEP 2: Convert variables to factors
# ================================
df$gender <- as.factor(df$gender)
df$covid_result <- as.factor(df$covid_result)

# Optional: give labels (0/1 ko readable banana)
levels(df$covid_result) <- c("Negative", "Positive")

# ================================
# STEP 3: Create Contingency Table
# ================================
table_data <- table(df$gender, df$covid_result)
print(table_data)

# ================================
# STEP 4: Hypothesis
# H0: gender and covid_result are independent
# H1: gender and covid_result are associated
# ================================

# ================================
# STEP 5: Perform Chi-square Test
# ================================
chi_result <- chisq.test(table_data)
print(chi_result)

# ================================
# STEP 6: Expected Frequencies
# ================================
print(chi_result$expected)

# ================================
# STEP 7: Decision (Accept / Reject H0)
# ================================
if (chi_result$p.value < 0.05) {
  print("Reject H0: Gender and COVID result are significantly associated")
} else {
  print("Accept H0: Gender and COVID result are not significantly associated")
}

# ================================
# STEP 8: Bar Plot
# ================================
barplot(table_data,
        beside = TRUE,
        col = c("lightblue", "lightpink"),
        legend = TRUE,
        main = "Gender vs COVID Result",
        xlab = "COVID Result",
        ylab = "Number of Patients")

# ================================
# STEP 9: Mosaic Plot
# ================================
mosaicplot(table_data,
           main = "Association between Gender and COVID Result",
           color = TRUE,
           xlab = "Gender",
           ylab = "COVID Result")
