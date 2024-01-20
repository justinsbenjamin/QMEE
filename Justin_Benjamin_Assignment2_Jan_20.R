# January 20th, 2024
# BIO 708 QMEE Winter 2024: Assignment 2

# Here is my assignment 2. I am examining the structures of my data and making sure
# there are not any obvious problems. I also saveRDS my dataframe that can be 
# opened and run in another script in a clean session. 

install.packages("ggplot2")
library(ggplot2)

# Examining the structure of the data for any thing weird. 
str(Tawh_Egg_2015_JSB)
summary(Tawh_Egg_2015_JSB)
class(Tawh_Egg_2015_JSB)
# Data looks good so far. Lengths and widths are numbers.
# Paddock, location, and egg ID are characters. 
# Dates are looking fine. 

eggLength <- Tawh_Egg_2015_JSB$Length
eggLength

eggWidth <- Tawh_Egg_2015_JSB$Width
eggWidth


# Some figures to visualize the date  for any anomalies or errors. 
hist(eggLength)
hist(eggWidth)

eggDimensions <- data.frame(eggLength, eggWidth)
eggDimensions
summary(eggDimensions)

# Scatterplot of egg dimensions
ggplot(eggDimensions, aes(x=eggWidth, y=eggLength)) +
  geom_point() + 
  xlab("Egg Width (mm)") +
  ylab("Egg Length (mm)") +
  theme_classic() +
  xlim(32, 42.5) +
  ylim(46, 70)

# Nothing pops out too much, no obvious skews. 
# There appears to be one egg that is very large with both the length and width
# much larger than the others. 

# Simple linear regression model
eggDimensionsModel <- lm(eggLength ~ eggWidth, data = Tawh_Egg_2015_JSB)
eggDimensionsModel
summary(eggDimensionsModel)

# Pearson correlation test
cor(eggWidth, eggLength, method = "pearson")

saveRDS(eggDimensions, file = "eggDimensions.rds")

