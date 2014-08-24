Code Book for Getting and Cleaning Data Course Project
========================================
## Data Overview ##
The data used for this course project are collected from the accelerometers from the Samsung Galaxy S smartphones. The source of the original data is : [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
A full description is available at the site where the data was obtained:[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This code book describes the variables used in the run_analysis R script.

## Variables ##
 - *Xtest*: table contents of test/X_test.txt
 - *Xtrain*:table contents of train/X_train.txt 
 - *ytest*: table contents of test/y_test.txt
 - *ytrain*: table contents of train/y_train.txt
 - *sub.test*: table contents of test/subject_test.txt
 - *sub.train*: table contents of train/subject_train.txt
 - *test*: Combination of the sub.test, Xtest and ytest data
 - *train*: Combination of the sub.train, Xtrain and ytrain data
 - *activity.labels*: table contents of activity_labels.txt
 - *features*: table contents of features.txt
 - *features2*: Subset of the features data with only the measurements on mean and standard deviation for each measurement
 - *data1*: (rbind) combination of the train and test data sets
 - *data2*: This variable is a subset of data1. It keeps the first three variables of data1 ie id, sub.id and act.id and extract its variables by the id of features2
 - *data3*: Combination of data2 and the activity.labels data
 - *data4*: To obtain this data, we loop through the columns of data3 and replace their names with the features labels
 - *data5*: Subset of data4 in which the variables named "id" or "act.label" are removed 
 - *data6*:Dataframe returning the mean of each variable for each activity and each subject
 - *data7*: Subset of data6 in which the variables named "subject" or "activity" are removed
 - *DATA*: Combination of data7 and the activity labels data. This is the final tidy data set that has been written.