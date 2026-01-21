###############################################################################
# Data wrangling and visualisation lab.
# This script will get you started on handling data and creating visualizations
# in R and RStudio.
# To complete the exercises in this script, follow Chapter 2 Data wranglilng and 
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


###############################################################################
## Activity - Find out about packages (Section 2.3.1)
?here

## Activity - Import the data (Section 2.5.1)
## Now finish and run the code that will import the social media data for 
# you and store it to an object called social_media
social_media <- 

## Activity - View the data (Section 2.6.1)
## Now look at the data programmatically. Complete the following methods
# to view the data. Also update the comments with missing information.

# Method 2 - Use the View function
View() #view automatically displays the dataset in a tab.

# Method 3 - Use the head function
head() #head displays the first ...

# Method 4 -
str()

###############################################################################
## Activity - Summarise the data (Section 2.7.1)
# Summarise you data using the summary() function. Complete the code
# and run it. What do you notice about the data?

summary()


## Activity - find and replace -999 values (Section 2.8.1)
## Complete the below code to find out how many cases of -999 there are in the 
# time_on_social variable
social_media_filtered <- filter(social_media, time_on_social == ) #keep all rows where `time_on_social` is equal to -999
View() #view the filtered dataframe

count(social_media_filtered) #count the number of rows in the filtered dataframe

## Activity - pipe with pipes (Section 2.9.1)
## follow the piping activities to get the same results as you see in the chapter



## Time to replace those -999s with NAs, using mutate() and na_if().



## Now run the summary() function again to get a summary of your new dataframe


###############################################################################
## Activity - save the cleaned data (Section 2.10.1)
## Save the data as a csv file using the write_csv() and here() functions.
write.csv(social_media_NA, here("Output","PSYC2001_social-media-data-cleaned.csv"))

###############################################################################
## Activity - Make a blank canvas (Section 2.11.1)
# testing what happens when we run ggplot() by itself. Complete the line of 
# code below and run it
social_media_NA %>%
  ggplot(aes(y = ))

# Activity - add a boxplot / tidy up the x-axis /add some labels (Section 2.11.2-2.11.4)
social_media_NA %>%
  ggplot(aes(y = )) + #ggplot uses aesthetic (aes()) to map axes. 
    geom_boxplot() 
  
# Activity - creating a histogram using ggplot() (Section 2.11.5)
social_media_NA %>%
  ggplot(aes(x = )) + #ggplot uses aesthetic (aes()) to map axes. 
  geom_histogram() + #creates a histogram
  labs(x = "Time on social media (hours)", y = "Density") + #short for "labels", use to label axes and titles.
  theme_classic() #changes the theme of the plot to a classic theme. makes it prettier!
# You can also use theme_minimal(), theme_light(), theme_dark() etc.

