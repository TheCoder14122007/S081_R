# ================================
# Export Regression Results
# ================================

# Model summary to dataframe
model_summary <- as.data.frame(summary(model)$coefficients)

write.csv(model_summary,
          "C:/Users/itlab/Downloads/Linear_Regression_Summary.csv",
          row.names = TRUE)

# Prediction export
prediction_df <- data.frame(
  Playlist = 2000,
  Predicted_Streams_Million = predicted_value
)

write.csv(prediction_df,
          "C:/Users/itlab/Downloads/Prediction_Result.csv",
          row.names = FALSE)

# Excel export
library(writexl)

write_xlsx(
  list(
    Model_Summary = model_summary,
    Prediction = prediction_df
  ),
  "C:/Users/itlab/Downloads/Regression_Results.xlsx"
)

# Cleaned dataset export
write.csv(Song,
          "C:/Users/itlab/Downloads/Cleaned_Song_Data.csv",
          row.names = FALSE)

library(ggplot2)
# Plot export (PDF)
pdf("C:/Users/itlab/Downloads/Linear_Regression_Plot.pdf",
    width = 7, height = 5)

ggplot(Song, aes(x = playlist, y = streams_million)) +
  geom_point(color = "blue", shape = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Linear Regression Analysis using lm()",
    x = "Number of Playlists",
    y = "Streams (in millions)"
  ) +
  theme_minimal()

dev.off()

# Model summary to text file
sink("C:/Users/itlab/Downloads/Model_Summary.txt")
summary(model)
sink()

