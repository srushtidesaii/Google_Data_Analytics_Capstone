#Install Packages

install.packages("tidyverse") # For data manipulation, exploration and visualization
install.packages("lubridate") # For date functions
install.packages("skimr") # To simplify data cleaning tasks
install.packages("janitor") # To simplify data cleaning tasks


# Load Packages
library(tidyverse)
library(readr) # For importing data and it is part of core tidyverse
library(dplyr) # Functions to perform data manipulation tasks and it is a part of core tidyverse
library(skimr)
library(janitor)


#Setting up the working directory
getwd() #Displays the working directory path
setwd("/Users/srushtidesai/Desktop/Datasets") # To set the working directory accordingly to access the data



#Importing and reading separately 12 months data .csv files into dataframes
df1_202012 <- read_csv("202012-divvy-tripdata.csv")
df2_202101 <- read_csv("202101-divvy-tripdata.csv")
df3_202102 <- read_csv("202102-divvy-tripdata.csv")
df4_202103 <- read_csv("202103-divvy-tripdata.csv")
df5_202104 <- read_csv("202104-divvy-tripdata.csv")
df6_202105 <- read_csv("202105-divvy-tripdata.csv")
df7_202106 <- read_csv("202106-divvy-tripdata.csv")
df8_202107 <- read_csv("202107-divvy-tripdata.csv")
df9_202108 <- read_csv("202108-divvy-tripdata.csv")
df10_202109 <- read_csv("202109-divvy-tripdata.csv")
df11_202110 <- read_csv("202110-divvy-tripdata.csv")
df12_202111 <- read_csv("202111-divvy-tripdata.csv")


# Compare column names each of the files
# All files need to match perfectly with each other and should be consistent before we can join them into one file
colnames(df1_202012)
colnames(df2_202101)
colnames(df3_202102)
colnames(df4_202103)
colnames(df5_202104)
colnames(df6_202105)
colnames(df7_202106)
colnames(df8_202107)
colnames(df9_202108)
colnames(df10_202109)
colnames(df11_202110)
colnames(df12_202111)


# Inspect the dataframes and look for incongruencies
str(df1_202012)
str(df2_202101)
str(df3_202102)
str(df4_202103)
str(df5_202104)
str(df6_202105)
str(df7_202106)
str(df8_202107)
str(df9_202108)
str(df10_202109)
str(df11_202110)
str(df12_202111)



# Combine individual month's, 12 data frames into one big data frame (merged_all_trips)
merged_all_trips <- bind_rows(df1_202012,df2_202101,df3_202102,df4_202103,df5_202104,df6_202105,df7_202106,df8_202107,df9_202108,df10_202109,df11_202110,df12_202111)



# Inspect the new combined table that has been created
colnames(merged_all_trips)  #List of column names
nrow(merged_all_trips)  #How many rows are in data frame?
dim(merged_all_trips)  #Dimensions of the data frame?
head(merged_all_trips)  #See the first 6 rows of data frame.  Also tail(all_trips)
str(merged_all_trips)  #See list of columns and data types (numeric, character, etc)
summary(merged_all_trips)  #Statistical summary of data, mainly for numerics


#Export the merged data frame (merged_all_trips) to a new .csv file (merged_all_trips_uncleaned)
write_csv(merged_all_trips, "merged_all_trips_uncleaned.csv")



# Add columns for each ride that list the:
merged_all_trips$date <- as.Date(merged_all_trips$started_at) # date
merged_all_trips$year <- format(as.Date(merged_all_trips$date), "%Y") # year
merged_all_trips$month <- format(as.Date(merged_all_trips$date), "%m") # month
merged_all_trips$day <- format(as.Date(merged_all_trips$date), "%d") # day 
merged_all_trips$day_of_week <- format(as.Date(merged_all_trips$date), "%A") # day of the week
# This will allow us to aggregate ride data for each month, day, or year and on which day of the week 


# Add a "ride_length" calculation column to merged_all_trips dataframe
merged_all_trips <- merged_all_trips %>% mutate(ride_length = ended_at - started_at)


# Inspect the structure of the columns
str(merged_all_trips)


# Convert "ride_length" from 'difftime' to numeric so we can do calculations on the data
merged_all_trips$ride_length <- as.numeric(as.character(merged_all_trips$ride_length))
is.numeric(merged_all_trips$ride_length) #To check, if it returns TRUE then implies the datatype has been converted to numeric


# Filtered out and removed rows which had negative ride_length value
merged_all_trips <- merged_all_trips %>% filter(ride_length > 0)


#Clean columns names and remove duplicates 
merged_all_trips <- merged_all_trips %>% clean_names() %>% unique()


#Export cleaned dataframe (merged_all_trips) to a new .csv file (merged_all_trips_cleaned.csv)
write_csv(merged_all_trips, "merged_all_trips_cleaned.csv")










