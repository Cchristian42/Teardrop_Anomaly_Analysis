# 1. Load libraries
library(dplyr)
library(ggplot2)
library(lubridate)

# Set working directory
filePath <- "~/Desktop/Network-Analysis"
setwd(filePath)

# 2. Read your CSV
df <- read.csv(
  "teardrop.csv",
  stringsAsFactors = FALSE
)

# 3. Make Time numeric
df$Time <- as.numeric(df$Time)

# 4. Duplicate EVERY row 200 times to simulate attack flood
anomalies <- df[rep(seq_len(nrow(df)), 200), ]

# 5. Add fake timestamps (spread over 60 seconds with jitter)
anomalies$Time <- seq(
  from = 0,
  to = 60,
  length.out = nrow(anomalies)
) + runif(nrow(anomalies), -0.5, 0.5)

# 6. Bump packet lengths for more visible spikes
anomalies$Length <- anomalies$Length + runif(nrow(anomalies), 0, 150)

# 7. Flag anomalies
anomalies <- anomalies %>% 
  mutate(anomaly = TRUE)

# 8. Combine original + fake anomalies and sort by time
df_full <- bind_rows(df, anomalies) %>% 
  arrange(Time)

# 9. Create the plot
ggplot(df_full, aes(x = Time, y = Length)) +
  geom_point(aes(color = anomaly), size = 2) +
  geom_line(color = "gray", alpha = 0.5) +
  scale_color_manual(values = c("FALSE" = "steelblue", "TRUE" = "red")) +
  labs(
    title = "Simulated Teardrop Attack - Fragment Overlap Spikes",
    subtitle = "Red points = simulated anomaly bursts (200x duplication)",
    x = "Time (seconds)",
    y = "Packet Length (bytes)"
  ) +
  theme_minimal()

# 10. Save plot for GitHub
ggsave(
  "teardrop_anomaly_plot.png",
  width = 9,
  height = 5.5
)