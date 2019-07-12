# This was created on the 12 of July by Malin Chimoyi


#cleaning the environment
rm(list=ls())


#setting the working directory
setwd("C:/Users/Malin/Desktop/ASSIGNMENT")

#loading the readr package which enables us to view it with the data types
library(readr)
library(tinytex)
library(tidyr)
library(broom)
library(purrr)
dta<-read_csv("mobilemoney_data.csv", col_names = TRUE, cols(gender = col_factor(),district = col_factor(), urban = col_factor()))


#looking at the data
str(dta)


#changing to factor 
#cleaning of the data this is to ensure the rows are observations and the columns are variables
#the data was clean.

#we skipped number two because it was ambigous and has no answer.


#This covers subsetting of the data using the dplyr package
library(dplyr)

demographics <- dta  %>%  select(age,gender,highest_grade_completed,hh_members)
demographics
write.csv(demographics,"demographics.csv", row.names = FALSE)

#conducting an EDA of the data using demographics
t<-table(demographics$age)
t


#we are plotting a scatter plot for the age as it is numerical data
#leading ggplot2
library(ggplot2)
library(hexbin)
ggplot(data= demographics) + geom_point(mapping = aes (age,hh_members))
ggplot(data= demographics) + geom_bin2d(mapping = aes (age,hh_members))
ggplot(data= demographics) + geom_hex(mapping = aes (age,hh_members))
ggplot(data= demographics) + geom_quantile(mapping = aes (age,hh_members))

View(dta)
table(account_type)
d<- dta %>% group_by(account_type) %>% summarise(number=n()) %>% mutate(percentage=number/sum(number)*100) %>% arrange(desc(percentage)) %>% ggplot()
d
