#This is the code for the Course Project for Getting and Cleaning Data
#For Coursera

#input the data manipulation packages
library(dplyr)
library(tidyr)

#read in the names of the features (variables for test/training data)
featurenames <- read.table("data//UCI HAR Dataset/features.txt")

#read in the test data and assign the column names to the variables
xtestdata <- read.table("data//UCI HAR Dataset/test//X_test.txt",
                        col.names=featurenames$V2)

#read in the activity type data, and the activity names
#then set the activity type to the string for the activity it
#represents
ytestdata <- read.table("data//UCI HAR Dataset//test//y_test.txt",
                        col.names="Activity")
activitynames <- read.table("data//UCI HAR Dataset/activity_labels.txt",
                            stringsAsFactors=FALSE)
ytestdata$Activity <- activitynames[ytestdata$Activity,]$V2



#read in the subject data
subdata <- read.table("data//UCI HAR Dataset//test//subject_test.txt",
                      col.names="Subject")


#create vector of featurenames containing "mean" or "std"
#shift by two for the offset from the first two columns
myfeaturenames <- sort(c(grep("mean",featurenames$V2),grep("std",featurenames$V2)))
myfeaturenames <- myfeaturenames+2


#bind the testing data, column-wise, into a single data frame
#then convert to tbl_df object so we can use dplyr/tidyr
testframe <- cbind(subdata,ytestdata,xtestdata)
testtable <- select(tbl_df(testframe),c(1,2,myfeaturenames))
#bind a column to the front indicating that this was data from the test set
testtable <- cbind(DataType=rep("Test",length(ytestdata)),testtable)


#repeat the steps above, but with the training data
xtraindata <- read.table("data//UCI HAR Dataset/train//X_train.txt",
                         col.names=featurenames$V2)
ytraindata <- read.table("data//UCI HAR Dataset/train//y_train.txt",
                         col.names="Activity")
subtraindata <- read.table("data//UCI HAR Dataset/train//subject_train.txt",
                           col.names="Subject")

ytraindata$Activity <- activitynames[ytraindata$Activity,]$V2

trainingframe <- cbind(subtraindata,ytraindata,xtraindata)
trainingtable <- select(tbl_df(trainingframe),c(1,2,myfeaturenames))
trainingtable <- cbind(DataType=rep("Training",length(ytraindata)),trainingtable)


#row bind the two data tables for the tidy data set for steps 1-4 in the project
#note, this is the first tidy data set produced, but we were not
#to actually export this data externally
meanstddatatable <- rbind(testtable,trainingtable)

#now, compute the means (averages) for each measurement, by subject and activity
#for the final part of the project
#please see the documentation for the aggregate function if you don't understand
#how the formula works in the first argument
aggregateddata <- aggregate(. ~ Subject+Activity,meanstddatatable,mean)

#drop the DataType column, and arrange the aggregated data by Subject
mytidytidydata <- arrange(select(letstrythis,-DataType),Subject)

#write the tidy data to a text file
write.table(mytidytidydata,"mytidytidydata.txt",row.names=FALSE)





