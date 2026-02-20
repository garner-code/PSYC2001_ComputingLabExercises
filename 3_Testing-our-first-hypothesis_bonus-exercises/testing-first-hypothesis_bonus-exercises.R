###############################################################################
# Testing our first hypothesis!
# To complete the exercises in this script, follow Chapter 3 from
# https://garner-code.github.io/PSYC2001_ComputingLabBook/sec-testing-first-hypothesis.html
# K. Garner, 2025
###############################################################################

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

## Activity - Load packages (Section 3.1.1)
# using the library() function. 
library(here) #loads in the specified package
library(tidyverse)


# load in data
social_media <- read.csv(file = here("Data","PSYC2001_social-media-data-cleaned.csv")) #reads in CSV files

# wide to long
social_media_likes <- social_media %>% 
  select("id","good_mood_likes","bad_mood_likes") %>% # choose columns
  pivot_longer(cols = ends_with("likes"), 
               names_to = "mood", 
               values_to = "likes")

###############################################################################
## Activity - Conducting a paired t-test (Section 3.7.1)
# Conducting a paired samples t-test

t.test(x=social_media$good_mood_likes, 
       y=social_media$bad_mood_likes,
       paired=TRUE)

## Bonus exercises!
# Use the mutate() function on the original social_media dataframe to 
# create a difference score column - i.e. subtract good_mood_likes from 
# bad_mood_likes (the code is below, in case you didn’t complete the 
# bonus exercises from last lab).
# (make social_media_diff dataframe first)
social_media_diff <- social_media %>% 
  mutate(likes_diff = good_mood_likes - bad_mood_likes)

# one sample t-test.
with(social_media_diff, t.test(likes_diff, mu=0))

# comment the code to interpret
social_media_likes %>% # take social_media_likes dataframe
  ggplot(aes(x=mood, y = likes, group=id)) + # set up our canvas in ggplot, we want mood on the x axis, likes on the y, and each id (person) to be plotted
  geom_line(alpha=0.5) + # draw a line for each person's data
  geom_point(size=1.8, alpha=0.5) + # adds a dot point in each mood condition for each person
  theme_bw() +
  labs(x="mood while on socials")
