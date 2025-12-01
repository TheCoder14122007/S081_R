# ==============================================================================
# R Script: Text Manipulation on TITANIC DATASET
# Functions: str_sub(), str_split(), separate()
# ==============================================================================

# Load necessary libraries
library(stringr)
library(tidyr)
library(dplyr)

# ==============================================================================
# 1. IMPORT TITANIC DATASET
# ==============================================================================

titanic_df <- read.csv(
  "C:/Users/Priya Gupta/Downloads/S081 Priya Rakesh Gupta - titanic.csv",
  na.strings = c("", "NA")
)

cat("\n--- Original Titanic Dataset (First 6 Rows) ---\n")
print(head(titanic_df))

# ==============================================================================
# 2. USING str_sub() → Extract Last Name from Name Column
# ==============================================================================

# Extract the position of the comma in each Name
comma_positions <- str_locate(titanic_df$Name, ",")[,1]

# Extract last name (everything before the comma)
titanic_df$LastName <- str_sub(titanic_df$Name, 1, comma_positions - 1)

cat("\n--- Extracted Last Names (First 6 Rows) ---\n")
print(head(titanic_df$LastName))

# ==============================================================================
# 3. USING str_split() → Split Name into Parts
# ==============================================================================

# Split based on comma ("LastName, Title FirstName")
name_split <- str_split(titanic_df$Name, ", ", simplify = TRUE)

# Assign new columns
titanic_df$LastName_2 <- name_split[,1]         # Last name
titanic_df$RestName   <- name_split[,2]         # Title + First name

cat("\n--- Data after str_split() (First 6 Rows) ---\n")
print(head(titanic_df[, c("Name", "LastName_2", "RestName")]))

# ==============================================================================
# 4. BONUS: Split the RestName into Title and First Names
# ==============================================================================

# Split RestName based on space (e.g., "Mr. Owen Harris")
rest_split <- str_split(titanic_df$RestName, " ", simplify = TRUE)

# First word = Title (Mr., Mrs., Miss., etc.)
titanic_df$Title <- rest_split[,1]

cat("\n--- Titles Extracted (First 6 Rows) ---\n")
print(head(titanic_df$Title))

# ==============================================================================
# 5. Using separate() → Split Ticket into Prefix & Number
# ==============================================================================

# Some tickets have prefixes (e.g. "A/5 21171"), some don’t
titanic_df <- titanic_df %>%
  separate(Ticket, into = c("Ticket_Prefix", "Ticket_Number"),
           sep = " ", fill = "right")

cat("\n--- After Splitting Ticket (First 6 Rows) ---\n")
print(head(titanic_df[, c("Ticket_Prefix", "Ticket_Number")]))

# ==============================================================================
# 6. OPTIONAL: Extract Deck Letter from Cabin using str_sub()
# ==============================================================================

titanic_df$Deck <- str_sub(titanic_df$Cabin, 1, 1)

cat("\n--- Extracted Deck (First 6 Rows) ---\n")
print(head(titanic_df$Deck))

# ==============================================================================
# END OF SCRIPT
# ==============================================================================
