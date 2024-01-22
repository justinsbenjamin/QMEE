# January 20th, 2024
# BIO 708 QMEE Winter 2024: Assignment 2

# Here is my assignment 2. I am examining the structures of my data and making sure
# there are not any obvious problems. I also saveRDS my dataframe that can be 
# opened and run in another script in a clean session. 

## BMB: *don't* use install.packages() in a script -- user should
##  get to decide/install these for themselves if they need it

## install.packages("ggplot2")
library(ggplot2)

## BMB:  this is confusing.  You're referring to a data frame, but you've
##  never read it in ... this cannot be a reproducible script, unless
##  I'm missing something. How did you read your data into R??
library(readxl)
Tawh_Egg_2015_JSB <- read_excel("Tawh_Egg_2015_JSB.xlsx")

# Examining the structure of the data for any thing weird. 
str(Tawh_Egg_2015_JSB)
summary(Tawh_Egg_2015_JSB)
class(Tawh_Egg_2015_JSB)
# Data looks good so far. Lengths and widths are numbers.
# Paddock, location, and egg ID are characters. 
# Dates are looking fine. 

## BMB: in general you should *not* copy variables out of data frames
## leaving them inside makes it easier to maintain consistency
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

## BMB: why not
eggDimensions <- (Tawh_Egg_2015_JSB
    |> dplyr::select(eggWdith = Width, eggLength = Length)
)
## ?


# Scatterplot of egg dimensions
ggplot(eggDimensions, aes(x=eggWidth, y=eggLength)) +
    geom_point() + 
    xlab("Egg Width (mm)") +
    ylab("Egg Length (mm)") +
    theme_classic() +
    ## BMB: why are you setting dimensions manually?
    xlim(32, 42.5) +
    ylim(46, 70)
## + geom_smooth(method = "lm")

# Nothing pops out too much, no obvious skews. 
# There appears to be one egg that is very large with both the length and width
# much larger than the others. 

## Simple linear regression model
## BMB: this is actually weird. eggLength and eggWidth are **not**
##  the names of the variables within this data frame.  It works anyway
##  because you have the variables in your global workspace ...
eggDimensionsModel <- lm(eggLength ~ eggWidth, data = Tawh_Egg_2015_JSB)
eggDimensionsModel
summary(eggDimensionsModel)

## BMB: could also add geom_smooth(method = "lm") to your ggplot above

# Pearson correlation test
cor(eggWidth, eggLength, method = "pearson")

saveRDS(eggDimensions, file = "eggDimensions.rds")

## mark: 1.8 -- need to work harder at making sure the script is reproducible --
##  as a check, always try running the code in a restarted R session to see if
##  everything works

