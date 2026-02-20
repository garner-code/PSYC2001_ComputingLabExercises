###############################################################################
# Testing for between group differences
# To complete the exercises in this script, follow Chapter 4 from
# https://garner-code.github.io/PSYC2001_ComputingLabBook/testing-for-differences-between-groups.html
# K. Garner, 2025
###############################################################################

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
## load packages
library(here) #loads in the specified package
library(tidyverse)

###############################################################################
## load data
social_media <- read.csv(file = here("Data","PSYC2001_social-media-data-cleaned.csv")) #reads in CSV files

###############################################################################
## make likes dataframe
social_media_likes <- social_media %>% 
  mutate(likes =(bad_mood_likes + good_mood_likes)/2 ) %>% # creates a new variable called likes which is the average of bad_mood_likes and good_mood_likes
  select(id, urban, likes, followers) # selects only the specified columns from the data frame

###############################################################################
## define the urban factor
social_media_likes <- social_media_likes %>% 
  mutate(urban = factor(urban, levels=c(1,2), labels=c('urban', 'rural'))) #changes the urban variable to a factor with levels urban and rural

## plot group differences
social_media_likes %>% 
  ggplot(aes(y = followers, fill = urban, x = urban)) + 
  geom_boxplot() + 
  labs(x = "Living Area", y = "Average Number of Followers") + 
  scale_fill_manual(values = c(rural = "magenta4", urban = "aquamarine4")) + 
  theme_classic() 


## 4.9.1
## make a variable called engagement (which is the ratio of likes and followers)
# plot hist
# get descriptives
# perform t-test
# plot group differences
social_media_likes <- social_media_likes %>% 
  mutate(engagement=likes/followers)

social_media_likes %>% 
  group_by(urban) %>%
  summarise(M=mean(engagement),
            SD=sd(engagement))

social_media_likes %>%
  ggplot(aes(x=engagement)) +
  geom_histogram(colour="black", fill="darkblue", binwidth=0.1) +
  theme_classic()

t.test(social_media_likes$engagement ~ social_media_likes$urban)

social_media_likes %>% 
  ggplot(aes(y = engagement, fill = urban, x = urban)) + 
  geom_boxplot() + 
  labs(x = "Living Area", y = "Engagement") + 
  scale_fill_manual(values = c(rural = "magenta4", urban = "aquamarine4")) + 
  theme_classic() +
  stat_summary(fun.y=mean, geom="point", size=8, pch=19)

# https://www.sthda.com/english/wiki/ggplot2-point-shapes

## 4.9.3
## what's wrong with this code?
social_media %>% 
  mutate(new_likes = (good_mood_likes+bad_mood_likes)/2)

## 4.9.4 - load dataset from tutorial and perform t-test
tut_dat <- read.csv(file = here("Data","Tutorial_4_Exercise_1.csv")) #reads in CSV files
# perform t test
with(tut_dat, t.test(recall ~ group, var.equal=TRUE))
