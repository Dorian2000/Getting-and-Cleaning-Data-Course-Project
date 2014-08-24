# Getting and Cleaning Data Course Project
# ####################################################################
setwd("D:/Mooc/Courses/First Five/3-Getting and Cleaning Data/Course Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
# Part I-: Merge the training and the test sets to create one data set.

## Let's read the different data from the training and test sets
sub.train <- read.table("train/subject_train.txt", skip=0, col.names=c("sub.id"))
Xtrain <- read.table("train/X_train.txt", skip=0, nrow=7352)
ytrain <- read.table("train/y_train.txt", col.names=c("act.id"))
sub.test <- read.table("test/subject_test.txt", col.names=c("sub.id"))
ytest <- read.table("test/y_test.txt", col.names=c("act.id"))
Xtest <- read.table("test/X_test.txt")

## create ID column (assign one row for each id, for each data set)
sub.train$id <- as.numeric(rownames(sub.train))
Xtrain$id <- as.numeric(rownames(Xtrain))
ytrain$id <- as.numeric(rownames(ytrain))
sub.test$id <- as.numeric(rownames(sub.test))
Xtest$id <- as.numeric(rownames(Xtest))
ytest$id <- as.numeric(rownames(ytest))

## MERGING
# merge sub.train and ytrain to train
train <- merge(sub.train, ytrain, all=TRUE)
# merge train and Xtrain
train <- merge(train, Xtrain, all=TRUE)
# merge sub.test and ytest to test
test <- merge(sub.test, ytest, all=TRUE)
# merge test and Xtest
test <- merge(test, Xtest, all=TRUE)
#combine train and test
data1 <- rbind(train, test)


# Part II- Extracts only the measurements on the mean and standard deviation for each measurement

## Read the features data
features <- read.table("features.txt", skip=0, col.names=c("feature.id", "feature.label"))
## Subset the features data using the grep1 function and extract only the measurements on mean and std
features2 <- features[grepl("mean\\(\\)", features$feature.label) | grepl("std\\(\\)", features$feature.label), ]
## Subset the data
### We keep the first three variables ie id, sub.id and act.id
### and extract the variables of data1 by the id of features2 (+3 to match the same number of columns as feature.id)
data2 <- data1[, c(c(1, 2, 3), features2$feature.id + 3) ]

# Part III-: "Use descriptive activity names to name the activities in the data set."
## Read the activity labels data
activity.labels = read.table("activity_labels.txt", col.names=c("act.id", "act.label"))
## Merge it with data2 to data3
data3 <- merge(data2, activity.labels)

# Part IV-: "Appropriately labels the data set with descriptive activity names."

## We remove the () from the features labels
features2$feature.label <- gsub("\\(\\)", "", features2$feature.label)
## And we replace the "-" with "."
features2$feature.label <- gsub("-", ".", features2$feature.label)
## Store the length of the feature.label vector in an object called lc
lc <- length(features2$feature.label)
## Loop through the columns of data3 (i+3 means the first three columns are skipped) and 
## replace their names with the features labels
for (i in 1:lc) {
        colnames(data3)[i + 3] <- features2$feature.label[i]
}
data4 <- data3 # Store this new dataset into a "dataframe" object named data4
# Create the txt data set in the working directory
write.table(file="data4.txt", row.names=FALSE, x=data4)

# Part 5: "Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject."
## Return a subset of the data in which the variables named "id" or "act.label" are removed 
data5 <- data4[,!(names(data4) %in% c("id","act.label"))]
## Compute the mean of each variable for each activity and each subject
data6 <-aggregate(data5, by=list(subject = data5$sub.id, activity = data5$act.id), FUN=mean, na.rm=TRUE)
## Return a subset of the data in which the variables named "subject" or "activity" are removed 
data7 <- data6[,!(names(data6) %in% c("subject","activity"))]
## Merge the data and activities labels
DATA <- merge(data7, activity.labels)
## Create the txt data set in the working directory
write.table(file="Data.txt", row.names=FALSE, x=DATA)