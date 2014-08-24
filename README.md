Getting and Cleaning Data Course Project
========================================

*This READ.ME file gives an overview of the assignment of this course project and explains the structure of the script submitted*

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Here is the link for the data used for the project [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You should create one R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## This is how the script works##
- Read the training and test data sets
- Create id columns and assign one row for each id, for each data set
- Merging the training sets, the test sets to have two separate sets 
- Combine the two sets to have one data set named data1
- Read the features data
- Subset the features data and extract only the measurements on mean and std
- Keep the first three variables of the data1 set ie id, sub.id and act.id and extract the variables of data1 by the id of features2 (+3 to match the same number of columns as feature.id) to get data2
- Read the activity labels data
- Merge the activity labels with data2 to get data3
- Remove the () from the features labels and replace the "-" with "."
- Store the length of the feature.label vector in an object named lc
- For loop through the columns of data3 (i+3 means the first three columns are skipped) and replace their names with the features labels
- Store this new dataset into a "dataframe" object named data4
- Create the first tiny data set in the working directory named data4.txt
- Return a subset of the data named data5 in which the variables named "id" or "act.label" are removed 
- Compute the mean of each variable for each activity and each subject and return the results in a new dataframe named data6
- Return a subset of the data named data 7 in which the variables named "subject" or "activity" are removed
- Merge data7 and activities labels in a new data set named DATA
- Create the second independent tidy data set with the average of each variable for each activity and each subject in the working directory named Data.txt