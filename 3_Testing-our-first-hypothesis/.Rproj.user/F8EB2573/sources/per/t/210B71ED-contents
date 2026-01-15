###############################################################################
# Testing our first hypothesis!
# To complete the exercises in this script, follow Chapter X from
# insert book here
# K. Garner, 2025
###############################################################################

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
# Check if packages are installed, if not install.
if(!require(here)) install.packages('here') #checks if a package is installed and installs it if required.
if(!require(tidyverse)) install.packages('tidyverse')

## Activity - load packages using `library()`


###############################################################################
## Activity - formulate a hypothesis
## Write a comment here about what differences you expect there to be between 
## urban and rural participants in terms of their social media likes and followers
#
#

###############################################################################
## Activity - Load in data and check it



## check the data has loaded in correctly by using the head() function to view as many rows as you 
## would like
head(social_media, ??)


###############################################################################
## Activity - Creating a new likes variable

## calculate what values you should get for the first three rows of the dataframe, 
## when you average bad_mood_likes and good_mood_likes. Write the answers here
## as comments. We have started the first comment for you.
# Row 1:
# 
# 

## run this to create the `likes` variable and see the output
social_media %>% 
  mutate(likes =(bad_mood_likes + good_mood_likes)/2 )

## amend the code above to select only id, urban, like, and followers, and save 
## to a data frame object called social_media_likes


## complete this line of code to check you kept the variables you want
## use it to see as many lines as you want to see
head()

###############################################################################
## Activity - defining factors

# complete the below line of code and run it to get info about the 
# social_media_likes data frame
str()

## now run the below code to turn urban from an integer to a factor
social_media_likes <- social_media_likes %>% 
  mutate(urban = factor(urban, levels=c('urban', 'rural'))) #changes the urban variable to a factor with levels urban and rural

#############################################################################
## Activity - Adapting our previous code to make new histograms

# change this code so that it creates a histogram of the likes variable
social_media_NA %>%
  ggplot(aes(x = time_on_social)) + #ggplot uses aesthetic (aes()) to map axes. 
  geom_histogram(binwidth=10, col="black", fill="seagreen") + #creates a histogram
  labs(x = "Time on social media", y = "Density") + #short for "labels", use to label axes and titles.
  theme_classic() #changes the theme of the plot to a classic theme. makes it prettier!

## copy and paste your new code here, and change it so that you get a histogram
## of the followers variable instead.



###############################################################################
## Activity - Adapt the code to get the mean and standard deviations for likes and followers

social_media_descriptives <- social_media_likes %>% # save to new object called social_media_descriptives
  group_by(???) %>% # group the data by urban
  summarise(
    mean_followers = mean(followers), # calculate the mean number of followers for urban and rural groups separately
    mean_likes = mean(likes), # same for likes
    sd_followers = sd(???),  # calculate the sd of followers
    sd_likes = sd(???) # calculate the sd of likes
  )

social_media_descriptives # view the new dataframe object

###############################################################################
## Activity - Performing independent samples t-tests

t.test(likes~urban, data=social_media_likes) # conducts an independent samples t-test to see if likes differ by urban/rural status
## save the output of the t.test for later reference
likes_t <- t.test(likes~urban, data=social_media_likes) 
likes_t # view the output

## Interpret the output as a comment below.

## now complete the code below for the followers variable
t.test(???~urban, data=social_media_likes) # conducts an independent samples t-test to see if followers differ by urban/rural status
# save it for later, if you like!

###############################################################################
## Activity - Visualising group differences

## here is the code for a grouped boxplot of likes by urban/rural status
social_media_likes %>% 
  ggplot(aes(y = likes, fill = urban, x = urban)) + # here we are telling ggplot that we will be putting likes
  # on the y axis, that we will fill in our boxplots with colour using the urban factor, and that urban will go on the x-axis
  geom_boxplot() + # this function creates a boxplot
  labs(x = "Living Area", y = "Average Rate of Likes") + # here we use labs() to label our axes.
  scale_fill_manual(values = c(rural = "plum", urban = "cyan2")) + #manually define the filled in colours of specific parts of a graph - see here for more R colours: https://r-graph-gallery.com/42-colors-names.html
  theme_classic() 

# copy and paste it here, and amend it to create a boxplot of followers by urban/rural status

# now copy and paste the code to save the plot, and amend it for the followers boxplot

