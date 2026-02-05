###############################################################################
# Testing our first hypothesis!
# To complete the exercises in this script, follow Chapter 3 from
# https://garner-code.github.io/PSYC2001_ComputingLabBook/sec-testing-first-hypothesis.html
# K. Garner, 2025
###############################################################################

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
# Check if packages are installed, if not install.
if(!require(here)) install.packages('here') #checks if a package is installed and installs it if required.
if(!require(tidyverse)) install.packages('tidyverse')

## Activity - Load packages (Section 3.1.1)
# using the library() function. 


###############################################################################
## Activity - Defining our hypotheses (Developing our hypotheses) (Section 3.2.1)
## add your answer to the below questions, as comments (i.e. preceded by a #)
# 1. Should there be a difference in the number of likes between the mood conditions?
# 
# 2. What direction do you think this difference could be? 
# Can you formulate an experimental hypothesis each way – i.e. good mood likes > 
# bad mood likes, and vice versa?
#
# 3. What is the null hypothesis?
#

###############################################################################
## Activity - Loading in the data (Section 3.3.1)


# Now Amend the code below to read in your fresh data
social_media <- read.csv(file = here(???,"PSYC2001_social-media-data-cleaned.csv"))

# now use the summary function to check your data, especially to make sure the pesky
# -999 values are gone!


###############################################################################
## Activity - Get back on the pipes (Section 3.4.1)

## run this code so you can see what it does
social_media %>% 
  select("id","good_mood_likes","bad_mood_likes") # choose which columns we want keep in our dataframe

## now run this code to pivot the data into longform format and see the results
social_media %>% 
  select("id","good_mood_likes","bad_mood_likes") %>% # choose columns we want keep in our dataframe
  pivot_longer(cols = ends_with("likes"), names_to = "mood", values_to = "likes")

## now, very important! amend the code above so that the new dataframe is saved to an object called
# social_media_likes. Then run the code to create the new dataframe.

# check the new dataframe using the head function. Remember to make your code match what's in the book!
(social_media_likes)


###############################################################################
## Activity - start plotting (Section 3.4.2)
## Plotting the data real pretty
social_media_likes %>% 
  ggplot(aes(x = likes, group = mood, fill = mood)) + # set canvas aesthetics
  geom_density() # use the data to draw a density plot 

# bonus activity - can you use the export button in the plots pane to save the figure to 
# the Output folder?

## Activity - So you've visualised your data, now what? (Section 3.4.3
## provide your answers in comment form below
## 1. Are the distributions of likes in each mood roughly normal?  
##
## 2. Are there any obvious outliers that might affect the results of our statistical test? 
##

###############################################################################
## Activity - get descriptive! (Section 3.5.1)
## Get descriptive statistics

social_media_likes %>% 
  group_by(mood) %>% #split the data by mood
  summarise(mean = mean(likes),
            sd = sd(likes)) #calculate the mean number of likes and standard deviation


###############################################################################
## Activity - Conducting a paired t-test (Section 3.7.1)
# Conducting a paired samples t-test

social_media$

t.test(x=social_media$, 
       y=social_media$,)


## Write your interpretation of the output as a comment below.
#
## Note down the 95% confidence interval for the difference between means, 
## and an interpretation of what this means in the context of our hypothesis.
