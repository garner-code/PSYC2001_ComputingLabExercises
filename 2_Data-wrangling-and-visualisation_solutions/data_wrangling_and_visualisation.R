###############################################################################
# Data wrangling and visualisation lab.
# This script will get you started on handling data and creating visualizations
# in R and RStudio.
# To complete the exercises in this script, follow Chapter 2 Data wrangling and 
# visualisation - 
# https://garner-code.github.io/PSYC2001_ComputingLabBook/data-wrangling-and-visualisation.html
# K. Garner, 2025
###############################################################################

# Before you do any activities!
rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
## Activity - Load your packages (Section 2.1.1)
## Copy and paste the code to install packages and load packages 

# Check if packages are installed, if not install.
if(!require(here)) install.packages('here') #checks if a package is installed and installs it if required.
if(!require(tidyverse)) install.packages('tidyverse')

library(here) #loads in the specified package
library(tidyverse)

###############################################################################
## Activity - Find out about packages (Section 2.3.1)
?here

###############################################################################
## Activity - Import the data (Section 2.5.1)
## Now finish and run the code that will import the social media data for 
# you and store it to an object called social_media
social_media <- read.csv(file = here("Data","PSYC2001_social-media-data.csv")) #reads in csv files

###############################################################################
## Activity - View the data (Section 2.6.1)
## Now look at the data programmatically. Complete the following methods
# to view the data. Also update the comments with missing information.

# Method 2 - Use the View function
View(social_media) #view automatically displays the dataset in a tab.

# Method 3 - Use the head function
head(social_media) #head displays the first 6 rows of each variable.

# Method 4 - Use the str function
str(social_media) #displays an overall summary of the object and variable structure.

###############################################################################
## Activity - Summarise the data (Section 2.7.1)
# Summarise you data using the summary() function. What do you notice about the data?

summary(social_media) #summary provides a quick overview of the data in each variable.
# note, other options are available (e.g. quantile())

###############################################################################
## Activity - find and replace -999 values (Section 2.8.1)
## Complete the below code to find out how many cases of -999 there are in the 
# time_on_social variable
social_media_filtered <- filter(social_media, time_on_social == -999) #keep all rows where `time_on_social` is equal to -999
View(social_media_filtered) #view the filtered dataframe

count(social_media_filtered) #count the number of rows in the filtered dataframe

###############################################################################
## Activity - pipe with pipes (Section 2.9.1)
## follow the piping activities to get the same results as you see in the chapter

# First piping example - filter with pipe
social_media %>% #pass the values from social_media to the filter function
  filter(time_on_social == -999) #keep all rows that are equal to -999 

# Second piping example - filter and count with pipes
social_media %>% #pass the values from social_media to the filter function
  filter(time_on_social == -999) %>% #keep all rows that are equal to -999 
  count() #count the number of remaining columns

## Time to replace those -999s with NAs, using mutate() and na_if().

social_media_NA <- social_media %>%
  mutate(time_on_social = na_if(time_on_social,-999)) #mutate makes a column by altering rows. na_if replaces -999 with NA

## Now run the summary() function again 

summary(social_media_NA)

###############################################################################
## Activity - save the cleaned data (Section 2.10.1)
## Save the data as a csv file using the write_csv() and here() functions.
write.csv(social_media_NA, here("Output","PSYC2001_social-media-data-cleaned.csv"))

###############################################################################
## Activity - Make a blank canvas (Section 2.11.1)
# testing what happens when we run ggplot() by itself. Complete the line of 
# code below and run it
social_media_NA %>%
  ggplot(aes(y = time_on_social)) #ggplot uses aesthetic (aes()) to understand what should be on the x and y axis

# Activity - add a boxplot / tidy up the x-axis /add some labels (Section 2.11.2-2.11.4)
social_media_NA %>%
  ggplot(aes(y = time_on_social)) + #ggplot uses aesthetic (aes()) to map axes. 
  geom_boxplot() + #creates a boxplot
  scale_x_discrete() + #this tells ggplot that the x-axis is categorical.
  labs(y="Time on social media (hours)") #adds a y-axis label
  
# Activity - creating a histogram using ggplot() (Section 2.11.5)
social_media_NA %>%
  ggplot(aes(x = time_on_social)) + #ggplot uses aesthetic (aes()) to map axes. 
  geom_histogram() + #creates a histogram
  labs(x = "Time on social media (hours)", y = "Density") + #short for "labels", use to label axes and titles.
  theme_classic() #changes the theme of the plot to a classic theme. makes it prettier!
# You can also use theme_minimal(), theme_light(), theme_dark() etc.

