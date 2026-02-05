###############################################################################
# Linear regression analysis - making predictions
# To complete the exercises in this script, follow Chapter 6 from
# https://garner-code.github.io/PSYC2001_ComputingLabBook/linear-regression.html
# K. Garner, 2025
############################################################################### 

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
## Activity - load the packages here and tidyverse using the `library()` (Section 6.1)
## function

library(here)
library(tidyverse)

###############################################################################
## Activity - to what extent will political attitudes predict time spent on social (Section 6.2.1)
## media? Write your hypothesis here as a comment in your code.

# Hypothesis: Political attitude will positively predict time spent on social media.
# We expect that higher political attitude scores will be associated with more time on social media.
# Based on the correlation from last week, we might expect political attitude to account 
# for approximately 26% of the variance in time spent on social media.

###############################################################################
## Activity - copy and paste code from a previous week that will load a data set. (Section 6.2.2)
## amend it to load the "PSYC2001_social-media-attitude.csv" file that is in the 
## folder "Data"

social_media_attitude <- read.csv(file = here("Data", "PSYC2001_social-media-attitude.csv"))

## Check the data frame has loaded properly and it looks as you expect
head(social_media_attitude)

###############################################################################
## Activity - run the following line of code to see what it does to the social (Section 6.3.1)
## media data frame

social_media_attitude %>%
  select(id, time_on_social, polit_attitude) %>% # choose columns
  pivot_longer(                                   # go from wide -> long
    cols = c(time_on_social, polit_attitude), # the two key measures
    names_to  = "measure",                    # which measure is this value from?
    values_to = "value"                       # the numeric value itself
  )

## assign the above code/output to an object called sma_long
sma_long <- social_media_attitude %>%
  select(id, time_on_social, polit_attitude) %>% # choose columns
  pivot_longer(                                   # go from wide -> long
    cols = c(time_on_social, polit_attitude), # the two key measures
    names_to  = "measure",                    # which measure is this value from?
    values_to = "value"                       # the numeric value itself
  )

## run the below line of code to check sma_long
head(sma_long)

## check the result by running the line of code below so that we can use it with 
## the object `sma_long` instead of `social_media_likes`. Change the code so 
## that `x =` takes `value` column instead. Remove the `group` and `fill` 
## arguments as we don't need them right now.

## now adapt the below code
sma_long %>% 
  ggplot(aes(x = value)) + # set canvas aesthetics 
  geom_density() # use the data to draw a density plot 

## add the below piece of code to your existing code for the plot, to generate 
## a density plot for each measure
sma_long %>% 
  ggplot(aes(x = value)) + # set canvas aesthetics 
  geom_density() + # use the data to draw a density plot
  facet_wrap(~measure) # make a separate plot for each measure

###############################################################################
## Activity - arguments for lm() (Section 6.4.1)
## complete the following comments

# 1. the first two arguments for lm() are formula and data

# 2. the formula I need to use is time_on_social ~ polit_attitude 

## complete the following line of code and run it
mod <- lm(formula = time_on_social ~ polit_attitude, data = social_media_attitude)

## Run the following line of code in your script to see what was saved to the 
## object `mod` by the `lm()` function.
mod

## write the resulting regression equation as a comment below
# Regression equation: time_on_social = 0.5489 + 0.8083 * polit_attitude
# The regression coefficient is positive (0.8083), which means that as political 
# attitude increases, time spent on social media also increases.

## run the following line of code (Section 6.4.2)
summary(mod)
## write the R-squared value as a comment below
# R-squared = 0.2628 (or Multiple R-squared = 0.2628)
# This means that political attitude explains approximately 26.28% of the variance 
# in time spent on social media.

## identify the F statistic, degrees of freedom and p-value associated with the 
## overall model fit, and write these below.
# F-statistic: 19.95 on 1 and 56 DF
# p-value: 3.939e-05 (or p < .001)
# The model is statistically significant, meaning political attitude significantly 
# predicts time spent on social media.

## Write a comment here interpreting the model, including whether your hypothesis 
# was supported.
# The hypothesis was supported. Political attitude positively and significantly 
# predicted time spent on social media (F(1,56) = 19.95, p < .001, R² = 0.26).
# For every one-unit increase in political attitude score, time spent on social 
# media increases by approximately 0.81 hours per day. Political attitude accounts 
# for 26.28% of the variance in social media use, which is a medium to large effect size.

###############################################################################
## Activity - plot the line of best fit (Section 6.6.1)
## Run the following line of code and finish the comment next to geom_point(...)

social_media_attitude %>% 
  ggplot(aes(x = polit_attitude, y = time_on_social)) + # set up the canvas
  geom_point(colour = "orange") + # make a scatterplot
  geom_smooth(method = "lm", se = TRUE) + # add line of best fit with standard error shading
  labs(x = "Political Attitude", y = "Time on Social") + # define axis labels
  theme_classic() # make pretty
