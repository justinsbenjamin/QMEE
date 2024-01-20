# Justin Benjamin
# January 20th, 2024
# BIO 708 QMEE Winter 2024

# Using a read.RDS to read in my data from other script. 

library(ggplot2)

dimensionsEgg <- readRDS("eggDimensions.rds")

# Scatterplot of egg dimensions
ggplot(dimensionsEgg, aes(x=eggWidth, y=eggLength)) +
  geom_point(colour = "blue") + 
  xlab("Egg Width (mm)") +
  ylab("Egg Length (mm)") +
  theme_classic() +
  xlim(32, 42.5) +
  ylim(46, 70) +
  theme_light()

