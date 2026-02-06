###############################################################################
# Correlation analysis - relationships between continuous variables
# To complete the exercises in this script, follow Chapter 5 from
# https://garner-code.github.io/PSYC2001_ComputingLabBook/probing-statistical-relationships-with-correlation-analysis.html
# K. Garner, 2025
############################################################################### 

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
## Activity - load the packages `here` and `tidyverse` using the `library()` (Section 5.1.1)
## function

library(here)
library(tidyverse)

###############################################################################
## Activity - load 'PSYC2001_social-media-data-cleaned.csv' into a data frame 
## called social_media (Section 5.2.1)

social_media <- read.csv(file = here("Data","PSYC2001_social-media-data-cleaned.csv"))

## Check the data frame has loaded properly using your preferred method
head(social_media) # e.g.

###############################################################################
## Activity - get some political attitude (Section 5.3.1)

## Write the 3 values you get when multiplying the first 3 observations in 
# `polit_informed` each by 0.25, as a comment. We have started the first comment
# for you.
# Row 1: 2.3 * 0.25 = 0.575 + ...
# Row 2: 1.6 * 0.25 = 0.4 + ...
# Row 3: 1.9 * 0.25 = 0.475 + ...


# Amend the below code in your script, so that you save the data frame to an 
# object called `social_media_test`
social_media_test <- social_media %>% 
  mutate(test = polit_informed * 0.25)
# you will also amend the code above to create a variable called `test` (see 
# Section 5.3.1)

social_media_test <- social_media %>% 
  mutate(test = polit_informed * 0.25 + polit_campaign * 0.35)

# Run the code and then run the following line of code to check that it works.
View(social_media_test)

# once you have tested adding `+ 0.35 * polit_campaign` to your code, and you 
# are happy with the results, you can remove the `social_media_test` data frame from 
# your environment, using the following line of code
rm(social_media_test)

# Complete the following line of code to create the data frame saved to the object
# 'social_media_attitude' that contains the 'polit_attitude' variable
social_media_attitude <- social_media %>% 
  mutate(polit_attitude = 0.25 * polit_informed + 0.35 * polit_campaign + 0.4 * polit_activism)

# check the contents of the new data frame.
head(social_media_attitude)


###############################################################################
## Activity - save the results of your hard work (Section 5.3.2)

# check the contents again, once you have selected the key columns 
# (`id`, `time_on_social`, `polit_attitude`, `age`, and `urban`)
social_media_attitude <- social_media_attitude %>% 
  select(id, time_on_social, polit_attitude, age, urban)

head(social_media_attitude)

# amend the following code so that you save your new data frame to a file called 
# "PSYC2001_social-media-attitude.csv" in the "Data" folder.
write.csv(social_media_attitude, here("Data","PSYC2001_social-media-attitude.csv")) #creates a csv file from the dataframe social_media_attitude

###############################################################################
## Activity - noting down your hypothesis (Section 5.4.1)
# Write your null and alternate hypothesis as a comment here. 


###############################################################################
## Activity - looking for straight lines (Section 5.5.1)

# run the below code to create a scatterplot of polit_attitude and time_on_social
social_media_attitude %>% 
  ggplot(aes(x = polit_attitude, y = time_on_social)) + # set up the canvas
  geom_point(colour = "orange") + # make a scatterplot
  labs(x = "Political Attitude", y = "Time on Social") +  # define labels
  theme_classic() # make pretty

# copy and paste the above code here, and then amend it to get a scatter plot for
# polit_attitude against age
social_media_attitude %>% 
  ggplot(aes(x = polit_attitude, y = age)) +
  geom_point(colour = "blue") +
  labs(x = "Political Attitude", y = "Age") +
  theme_classic()

# repeat, and amend to get the scatterplot for time_on_social against 
# age.
social_media_attitude %>% 
  ggplot(aes(x = time_on_social, y = age)) +
  geom_point(colour = "red") +
  labs(x = "Time on Social", y = "Age") +
  theme_classic()

###############################################################################
## Activity - calculate the correlation co-efficient (Section 5.6.1)

# run this line of code
social_media_attitude %>% 
  summarise(r = cor(time_on_social, polit_attitude, use = "complete.obs")) #use = "complete.obs" removes all NA values from the correlation.


###############################################################################
## Activity - statistical test of Ho for the correlation co-efficient (Section 5.7.1)
# run this line of code and interpret the output
cor.test(formula = ~ time_on_social + polit_attitude, data = social_media_attitude, use = "complete.obs") #formula contains both numeric variables on the right hand side.
#use = "complete.obs" removes all NA values from the correlation. 

# complete this line of code and check it gives you the same as above (Section 5.5.2)
cor.test(x = social_media_attitude$time_on_social, 
         y = social_media_attitude$polit_attitude, use = "complete.obs")

## add your answers to the following questions as comments:
#  What is the relationship between time_on_social and attitude?
# Can you reject the null hypothesis?
# Was your hypothesis supported? 
# What does the ‘df’ value tell you about the sample size? 
# Why is it that number?

###############################################################################
# copy and paste your preferred cor.test() method here, and run the correlation analysis
# to assess the relationship between the second pair of variables that appeared to share
# a linear relationship. (Section 5.8.1)

# The second pair with linear relationship is polit_attitude and age
social_media_attitude %>% 
  summarise(r = cor(age, polit_attitude, use = "complete.obs"))

cor.test(formula = ~ age + polit_attitude, data = social_media_attitude, use = "complete.obs")

