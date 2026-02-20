###############################################################################
# Correlation analysis - relationships between continuous variables
# To complete the exercises in this script, follow Chapter 5 from
# https://garner-code.github.io/PSYC2001_ComputingLabBook/probing-statistical-relationships-with-correlation-analysis.html
# K. Garner, 2025
############################################################################### 

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
library(here)
library(tidyverse)

###############################################################################
## Activity - load 'PSYC2001_social-media-data-cleaned.csv' into a data frame 
## called social_media (Section 5.2.1)
social_media <- read.csv(file = here("Data","PSYC2001_social-media-data-cleaned.csv"))

social_media_attitude <- social_media %>% 
  mutate(polit_attitude = 0.25 * polit_informed + 0.35 * polit_campaign + 0.4 * polit_activism)

###############################################################################
## Activity - calculate the correlation co-efficient (Section 5.6.1)

# run this line of code
social_media_attitude %>% 
  summarise(r = cor(time_on_social, polit_attitude, use = "complete.obs")) #use = "complete.obs" removes all NA values from the correlation.

#########################################################################
## Bonuses
# Can you take the social_media_attitude data frame and plot the data 
# for each of the 3 subscales: polit_informed, polit_campaign and 
# polit_activism?# 
polit_subscales <- social_media_attitude %>%
  select(id, polit_informed, polit_campaign, 
         polit_activism) %>%
  pivot_longer(cols=starts_with("polit"), names_to="subscale",
               values_to="score")

polit_subscales %>% 
  ggplot(aes(x=score, fill=subscale)) +
  geom_histogram(alpha=0.5) +
  facet_wrap(~subscale) +
  theme_minimal()
  
polit_subscales %>%
  ggplot(aes(x=subscale, y=score, fill=subscale)) +
  geom_violin() +
  geom_boxplot(width=0.25)

# Can you take the social_media_attitude use the group_by() and summarise() 
# functions to build a set of pipes where you take the social_media_attitude data frame, and the result is separate correlation coefficient values ( 
# r ) between the time_on_social and age variables for 
# Urban and Rural participants?

social_media_attitude %>% 
  group_by(urban) %>%
  summarise(r = cor(time_on_social, age, 
                    use = "complete.obs")) #use = "complete.obs" removes all NA values from the correlation.

# Can you use the select() and cor() function to create a pipe that 
# takes the social_media_attitude data frame, and that produces a 
# correlation matrix that shows the correlations between all the variables you are interested in?
social_media_attitude %>% select(age, time_on_social,
                                 followers, polit_informed,
                                 polit_activism) %>%
  cor(use="complete.obs")
