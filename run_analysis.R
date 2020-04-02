setwd("~/Desktop/Exercises/Course3/UCI HAR Dataset")
library(tidyverse)
library(plyr)

features <- read.table("./features.txt", col.names = c("n","functions"))
activities <- read.table("./activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt", col.names = features$functions)
y_train <- read.table("./train/y_train.txt", col.names = "code")

subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt", col.names = features$functions)
y_test <- read.table("./test/y_test.txt", col.names = "code")


#1. Merges the training and the test sets to create one data set.
X<-rbind(x_train, x_test)
Y<-rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Data <- cbind(Subject, Y, X)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
Data_mean_std<-Data[,grepl("mean|std|subject|code",colnames(Data))]

#3. Uses descriptive activity names to name the activities in the data set
Data_mean_std$activity <- activities[Data_mean_std$code, 2]

#4. Appropriately labels the data set with descriptive variable names.
names(Data_mean_std) <- gsub("Acc", "Acceleration", names(Data_mean_std))
names(Data_mean_std) <- gsub("^t", "Time", names(Data_mean_std))
names(Data_mean_std) <- gsub("^f", "Frequency", names(Data_mean_std))
names(Data_mean_std) <- gsub("BodyBody", "Body", names(Data_mean_std))
names(Data_mean_std) <- gsub("mean", "Mean", names(Data_mean_std))
names(Data_mean_std) <- gsub("std", "Std", names(Data_mean_std))
names(Data_mean_std) <- gsub("Freq", "Frequency", names(Data_mean_std))
names(Data_mean_std) <- gsub("Mag", "Magnitude", names(Data_mean_std))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Data_Final<-aggregate(. ~subject + activity, Data_mean_std, mean)
Data_Final<-Data_Final[order(Data_Final$subject,Data_Final$activity),]
write.table(Data_Final, file = "TidyData.txt",row.name=FALSE)
  
  
