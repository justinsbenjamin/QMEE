# Justin Benjamin 
# BIO 708: QMEE
# Assignment 3: Visualization 

# This assignment uses GGplot to make some figures using my egg size data 

library(readxl)
library(ggplot2)
library(tidyr)

data <- read_xlsx("Tawh_Egg_2015_JSB.xlsx")

# Scatterplot of egg dimensions
ggplot(data, aes(x=Width, y=Length)) +
  geom_point() + 
  labs(x = "Egg Width (mm)", y = "Egg Length (mm)") +
  theme_classic() 

# Reshape the data into a longer format
reshaped_data <- data %>%
  gather(key = "Variable", value = "Value", Length, Width)

# Faceted histograms of the Length and Width of eggs
ggplot(reshaped_data, aes(x = Value)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~ Variable, scales = "free") +
  theme_classic() +
  labs(x = "Measurement", y = "Count")

# Faceted QQ plot
ggplot(mapping = aes(sample = Value)) +
  geom_qq(data = reshaped_data) +
  geom_abline(intercept = mean(reshaped_data$Value), slope = sd(reshaped_data$Value), color = "red") +
  labs(x = "Theoretical Quantiles",
       y = "Sample Quantiles") +
  theme_classic() +
  facet_wrap(~ Variable, scales = "free")











