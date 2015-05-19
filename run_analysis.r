#This is the code for the course project for Getting and Cleaning Data
#For Coursera

#input the data manipulation packages
library(dplyr)
library(tidyr)

#read in the names of the features (variables for test/training data)
featurenames <- read.table("data//UCI HAR Dataset/features.txt")

#read in the test data and assign the column names to the variables
xtestdata <- read.table("data//UCI HAR Dataset/test//X_test.txt",
                        col.names=featurenames$V2)

#read in the activity type data
ytestdata <- read.table("data//UCI HAR Dataset//test//y_test.txt",
                        col.names="Activity")

#read in the subject data
subdata <- read.table("data//UCI HAR Dataset//test//subject_test.txt",
                      col.names="Subject")





#bind the testing data, column-wise, into a single data frame
testframe <- cbind(subdata,ytestdata,xtestdata)



#repeat the steps above, but with the training data
xtraindata <- read.table("data//UCI HAR Dataset/train//X_train.txt",
                         col.names=featurenames$V2)
ytraindata <- read.table("data//UCI HAR Dataset/train//y_train.txt",
                         col.names="Activity")
subtraindata <- read.table("data//UCI HAR Dataset/train//subject_train.txt",
                           col.names="Subject")

trainingframe <- cbind(subtraindata,ytraindata,xtraindata)






