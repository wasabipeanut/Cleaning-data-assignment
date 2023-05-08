setwd("C:/Users/enaij/Documents/R learning/UCI HAR Dataset")
library(dplyr)

#Open test and training data
features <-read.table("./features.txt", col.names = c("n", "features"))
activity <- read.table("./activity_labels.txt", col.names = c("Labels", "activity"))
X_test<- read.table("test/X_test.txt", col.names = features$features)
Y_test <- read.table("test/y_test.txt", col.names = c("Labels"))
testsubject<-read.table("test/subject_test.txt", col.names = c("Subject"))
X_train<-read.table("train/X_train.txt", col.names = features$features)
Y_train<-read.table("train/y_train.txt", col.names = c("Labels"))
trainsubject<-read.table("train/subject_train.txt", col.names = c("Subject"))

#merge data sets
X <-rbind(X_train, X_test)
Y<- rbind(Y_train, Y_test)
Subject <- rbind(trainsubject, testsubject)
DF_merge<- cbind (Subject, Y, X)

#Use descriptive activity names to name the activities
DF_clean <-DF_merge %>% select(Subject, Labels, contains ("mean"), contains ("std"))
DF_clean$Labels <- activity[DF_clean$Labels, 2]

names(DF_clean)[2] = "activity"
names(DF_clean)<-gsub("Acc", "Accelerometer", names(DF_clean))
names(DF_clean)<-gsub("Gyro", "Gyroscope", names(DF_clean))
names(DF_clean)<-gsub("BodyBody", "Body", names(DF_clean))
names(DF_clean)<-gsub("Mag", "Magnitude", names(DF_clean))
names(DF_clean)<-gsub("^t", "Time", names(DF_clean))
names(DF_clean)<-gsub("^f", "Frequency", names(DF_clean))
names(DF_clean)<-gsub("tBody", "TimeBody", names(DF_clean))
names(DF_clean)<-gsub("-mean()", "Mean", names(DF_clean), ignore.case = TRUE)
names(DF_clean)<-gsub("-std()", "STD", names(DF_clean), ignore.case = TRUE)
names(DF_clean)<-gsub("-freq()", "Frequency", names(DF_clean), ignore.case = TRUE)
names(DF_clean)<-gsub("angle", "Angle", names(DF_clean))
names(DF_clean)<-gsub("gravity", "Gravity", names(DF_clean))

#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
DF_final <- DF_clean %>% group_by (Subject, activity) %>% summarise_all (funs(mean))
write.table(DF_final, "FinalData.txt", row.name=FALSE)