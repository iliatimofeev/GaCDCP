# TODO: Add comment
# 
# Author: Ilya
###############################################################################



#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation 
#	for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set 
#	with the average of each variable for each activity and each subject.

require("plyr")
require("data.table")
require("curl")
require("stringr")
#Step 0 get project raw data. Here are the data for the project:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
print(getwd())
if(!file.exists("UCI HAR Dataset")){
	if(!file.exists("dataset.zip")){
		fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
		curl_download(fileurl,"dataset.zip", mode = "wb")
	}
	print(unzip("dataset.zip")) 
}

getpath<-function(dataset,datatype) {
	file.path (".","UCI HAR Dataset",dataset,paste0(datatype,"_",dataset,".txt"))
}
#Uses selected features in data set.
features <- read.table(file.path (".","UCI HAR Dataset","features.txt"),stringsAsFactors = F)
#the measurements on the mean and standard deviation 
mean_and_standard <-which(str_detect(features[,2],"\\-mean\\(\\)|\\-std\\(\\)"))

#Uses descriptive activity names to name the activities in the data set
activity_labels <- fread(file.path (".","UCI HAR Dataset","activity_labels.txt"),stringsAsFactors = F)
setnames(activity_labels,1:2,c("activity.id","activity"))
#load train data

#fread crushes, so we use read.table
X_train<-data.table(read.table(getpath("train","X"),col.names=features[,2],colClasses =c("numeric") ))

#Extracts only the measurements on the mean and standard deviation 
X_train<-X_train[,mean_and_standard,with=F]

#Add subject id
subject_train<-fread(getpath("train","subject"))
setnames(subject_train,1,c("subject"))
X_train[,subject:=subject_train$subject]

#Add descriptive activity names 
Y_train<-fread(getpath("train","Y"))
setnames(Y_train,1,c("activity.id"))
X_train[,activity.id:=Y_train$activity.id]
setkey(X_train,activity.id)
X_train[,activity:=X_train[activity_labels,activity,roll=TRUE]]



#load test data
X_test<-data.table(read.table(getpath("test","X"), col.names=features[,2],colClasses =c("numeric")))

#Extracts only the measurements on the mean and standard deviation 
X_test<-X_test[,mean_and_standard,with=F]

#Add descriptive activity names 
subject_test<-fread(getpath("test","subject"))
setnames(subject_test,1,c("subject"))
X_test[,subject:=subject_test$subject]

#Add descriptive activity names 
Y_test<-fread(getpath("test","Y"))
setnames(Y_test,1,c("activity.id"))
X_test[,activity.id:=Y_test$activity.id]
setkey(X_test,activity.id)
X_test[,activity:=X_test[activity_labels,activity,roll=TRUE]]

#1. Merges the training and the test sets to create one data set.

DT<-rbindlist(list(X_train,X_test),use.names=T)



#5. From the data set in step 4, creates a second, independent tidy data set 
#	with the average of each variable for each activity and each subject.
#subject_train.txt
tidy_data_set<-DT[,lapply(.SD,mean),.(activity,subject)]
write.table(tidy_data_set,"tidy_data_set.txt",row.name=FALSE ) 
#print(tidy_data_set)
