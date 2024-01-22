# Date: Jan 12, 2023
# Justin Benjamin
# BIO 708: QMEE Winter 2024

## JD: It's kind of bad form to put the date in the file name of a version-controlled file. Version control will take care of dates and history for you

# Here is a simple analysis of egg size data at Tawharanui regional park from 2015
# just to get started and figure out how to upload it to github.
# More data and other variables will be added throughout
# the next assignments and final project for further analyses. 

## BMB: don't install.packages() in a script
## install.packages("ggplot2")
library(ggplot2)

## JD: Before you can do something like this, you must have read in the file with some sort of read command. What command did you use, and can you get it working in the script? It's probably some sort of read.xlsx() if you are reading the file you uploaded
eggLength <- Tawh_Egg_2015_JSB$Length
eggLength

eggWidth <- Tawh_Egg_2015_JSB$Width
eggWidth

summary(eggLength)
summary(eggWidth)

eggDimensions <- data.frame(eggLength, eggWidth)
eggDimensions

# Scatterplot of egg dimensions
ggplot(eggDimensions, aes(x=eggWidth, y=eggLength)) +
  geom_point() + 
  xlab("Egg Width (mm)") +
  ylab("Egg Length (mm)") +
  theme_classic() +
  xlim(32, 42.5) +
  ylim(46, 70)

# Simple linear regression model
eggDimensionsModel <- lm(eggLength ~ eggWidth, data = Tawh_Egg_2015_JSB)
eggDimensionsModel
summary(eggDimensionsModel)

# Pearson correlation test
cor(eggWidth, eggLength, method = "pearson")

## JD: Incomplete; add a read command so that the script can run; let us know if this is still unclear

