###############################################################################
# Data wrangling and visualisation lab.
# This script completes the bonus exervises from Chapter 2 Data wrangling and 
# visualisation - 
# https://garner-code.github.io/PSYC2001_ComputingLabBook/data-wrangling-and-visualisation.html
# K. Garner, 2025
# Walk through with me here: https://youtu.be/gEGbTn4i4kI
###############################################################################

# Before you do any activities!
rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

# Check if packages are installed, if not install.
if(!require(here)) install.packages('here') #checks if a package is installed and installs it if required.
if(!require(tidyverse)) install.packages('tidyverse')

library(here) #loads in the specified package
library(tidyverse)


###############################################################################
## Import the data
social_media <-  read.csv(file = here("Data","PSYC2001_social-media-data.csv")) #reads in csv files

## filter out NAs
social_media_NA <- social_media %>%
  mutate(time_on_social = na_if(time_on_social, -999)) #mutate creates a new variable or modifies an existing one. na_if() replaces values with NA if they match a specified value. In this case, we are replacing -999 with NA in the time_on_social variable.

###############################################################################
## 2.13.1 - A bit more wrangling
# use the mutate() function to calculate the difference between `good_mood_likes` 
# and `bad_mood_likes` 
social_media_NA <- social_media_NA %>% 
  mutate(likes_diff = good_mood_likes - bad_mood_likes)

# filter and summarise - filter to get participants who spend more than 2 hours
# on social media, and then summarise to get the average number of followers
followers_info <- social_media_NA %>% 
  filter(time_on_social > 2) %>%
  summarise(mean_followers = mean(followers))

# 2.13.2 - Visualisation
# make a histogram of followers, change bin width and colour, play with adding themes
# favourite colours - #756bb1, #9ecae1
social_media_NA %>% 
  ggplot(aes(x=followers)) +
  geom_histogram(fill="#756bb1", colour="black",
                 binwidth=25) +
  theme_minimal()

# final challenge: use a plot style from the r-graph gallery
social_media_NA %>%
  ggplot(aes(y=followers,x='')) +
  geom_violin(fill="#9ecae1") +
  geom_boxplot(width=0.25) +
  theme_classic()
