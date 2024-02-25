# Justin Benjamin 
# BIO 708: QMEE
# Assignment 5: Linear models

# This assignment is setting up a preliminary linear model for my data on egg
# sizes in pūkeko. Unfortunately I don't have all of my data yet. 
# Lots of it is not in spreadsheets and I still need to fetch the raw data from 
# old field notebooks. So far I have data on the egg dimensions for 2015 and 
# I'm working on organizing 2016 but I don't yet have the data on my response 
# variables of hatching rates and survival rates. So what I am showing here 
# are my plans rather than actually running the code since I don't have the data yet.

library(readxl)
library(performance)
library(tidyr)
library(coefplot)
library(dotwhisker)
library(lme4)

# Hypothesis: 
# Female Pūkeko vary their reproductive investment to prioritize
# the survival of earlier young.

# Predictions: 
# 1. Eggs are larger in the first clutch of the season than subsequent clutches
# 2. The earlier laid eggs per female are larger than the later eggs.
# 3. Larger eggs have a greater hatching and survival success than smaller eggs.
# 4. Eggs laid by the dominant female will be larger than those laid by a subordinate female.

# The linear model I am proposing in this assignment cannot be run just yet since 
# I don't have the data but it is part of my statistical journal to see if I 
# am making the right choices of analyses based on what I see in the raw data 
# and diagnostic plots. 
# I have both egg length and egg width as measures of egg size but I'm thinking
# it might be easier to combine them into a single variable of size. 

## JD: I mean, you certainly have enough data here to experiment with making a linear model. Also, the model below is a “mixed-effects” model, so more complicated than what we have in mind.

data <- read_xlsx("Tawh_Egg_2015_JSB.xlsx")
data

# MODEL
# model <- glmer(response_variable ~ egg_size + clutch_number + (1|NestID), data = data)
# check_model(model)
# The model could also be made using the glmmTMB package.
# This should provide me with the five figures of the posterior predictive check, 
# linearity, homogeneity of variance, influencial observations, and the normality of
# residuals. Based on this diagnostic, I could decide if I need to make a transformation 
# like log or sq root, or specify the distribution of the data. 

# COEFFICIENT PLOT
# Here I could either use the functions coefplot::coefplot() or dotwhisker::dwplot()
# for my model to show clear effect size and confidence intervals. I could also 
# plot multiple models together using dwplot(list(model1, model2)). 
# What I should see is the dots with the ribbons for each predictor variable in my model(s).
# The error bars or ribbons around each dot or line represent the uncertainty or 
# confidence intervals associated with the estimated effects. The wider the interval, 
# the greater the uncertainty. I could also see if the confidence interval crosses
# zero to determine if saying there is a positive or negative effect is appropriate.





