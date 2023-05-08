# Cleaning-data-assignment

Introduction

This is the answer for Coursera course - "Getting and Cleaning Data Course Project"
The data is from accelerometers from the Samsung Galaxy S smartphone and retreived from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
There are 180 observations in this dataset

Variables

"Subject" - identifies the subject who performed the activity for each window sample
"activity" - there are six activities in total - (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The rest of the columns are the data merged from the training and test data. Using the below as an example: 
TimeBodyAccelerometer.mean...X - referes to the mean time recorded by the body accelerometer in the X dimension. 

Cleaning 

This data set merges the test and training data from originally provided.
It takes on the labels provided for each activity
Column names have been expanded with the descriptions - e.g. replaced "Acc" with "Accelerometer" for easier understanding. 

