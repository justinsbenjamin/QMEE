# Author: Justin Benjamin
# Course: BIO 708: Quantitative Methods of Ecology and Evolution
# Assignment: Generalized linear models

# Here is some data I created to create some generalized linear models.
# Most of this data is fabricated and is for assignment/learning purposes only.

library(performance)
library(tidyr)
library(dplyr)
library(lme4)
library(MASS)
library(patchwork)
library(emmeans)

Simulated_data <- read.csv("Simulated_Egg_Data.csv")
Simulated_data <- Simulated_data %>%
                  mutate(Egg_size = Length + Width) %>%
                  mutate(Survival_success_all = ifelse(is.na(Survival_success), 0, Survival_success))

## JD: Avoid big dumps in your output
## Simulated_data

# Hatching success model
Hatching_model <- glm(Hatching_success ~ Egg_size + Clutch_number + Female + 
                      Clutch_size + Egg_order,
             data = Simulated_data, family = binomial(link = "logit"))

performance::check_model(Hatching_model)
# Based on the diagnostic plots, the model seems to be a good fit for the data.
# There is one point in the binned residuals that is not within the error bounds
# but all the others are so I think that is minor enough to ignore. 

emm_contrasts_hatching <- emmeans(Hatching_model, specs = c("Egg_size", "Female", "Clutch_size", 
                                          "Egg_order", "Clutch_number"))
emm_contrasts_hatching
# Based on the emmeans, female C looks wonky.
## JD: Can you say a bit more about that?
# There were only 2 eggs from female C in the data so it might be fine to take out.
# There appears to be not be any large differences between females A and B or between
# clutches 1 and 2. 

summary(Hatching_model)
# Unsurprising, there is no significance. Not that I can interpret anything
# meaningful from these p-values but the lowest ones belongs to female A which is 
# the dominant female and the egg order that have been previously found to significantly
# affect hatching success. 



# Survival success model
# Here I am looking at the survival success of the eggs that did hatch and excluding
# the NA values (those that failed to hatch) from the data in the model. 
Survival_model <- glm(Survival_success ~ Egg_size + Clutch_number + Female + Clutch_size + Egg_order,
                      data = na.omit(Simulated_data), family = binomial(link = "logit"))

performance::check_model(Survival_model)
# Similar to the first model, the diagnostics look good.

emm_contrasts_survival <- emmeans(Survival_model, specs = c("Egg_size", "Female", "Clutch_size", 
                                          "Egg_order", "Clutch_number"))
emm_contrasts_survival
# There's a similar pattern here as there was for the last model. The different
# females have similar values between clutch 1 and clutch 2.

summary(Survival_model)


# This model looking at the survival compared to all eggs both those that hatched 
# but didn't survive and the eggs that failed to hatch.
Survival_model_2 <- glm(Survival_success_all ~ Egg_size + Clutch_number + Female 
                        + Clutch_size + Egg_order, data = Simulated_data, 
                        family = binomial(link = "logit"))

performance::check_model(Survival_model_2)

## JD: I guess this is what you meant
emm_contrasts <- emmeans(Survival_model_2, specs = c("Egg_size", "Female", "Clutch_size", 
                                          "Egg_order", "Clutch_number"))
emm_contrasts

summary(Survival_model_2)


# Both of these models probably should be mixed models with Clutch_ID as a random effect
# nested within group_ID as the eggs within a single nest are not independent of each other and
# if the group has a second clutch, those eggs in clutch 2 would also not be independent of the eggs
# from the first clutch. I'm not sure how but the eggs within a nest are not independent of only the 
# other eggs of that same female so maybe the mother ID would have to be included too. 

## JD: Yes, they should, but as you say this is for learning. 2/3

