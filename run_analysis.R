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
#1. Merges the training and the test sets to create one data set.
features <- read.table(file.path (".","UCI HAR Dataset","features.txt"),stringsAsFactors = F)
X_train<-read.table(file.path (".","UCI HAR Dataset","train","X_train.txt"),col.names=features[,2],colClasses =c("numeric") )
X_test<-read.table(file.path (".","UCI HAR Dataset","test","X_test.txt"), col.names=features[,2],colClasses =c("numeric"))
DT<-rbindlist(list(X_train,X_test),use.names=T)
#str(data)

#2. Extracts only the measurements on the mean and standard deviation 

mean_and_standard <-which(str_detect(features[,2],"\\-mean\\(\\)|\\-std\\(\\)"))
DT<-DT[,mean_and_standard,with=F]
#str(DT)

#3. Uses descriptive activity names to name the activities in the data set
activity_labels <- fread(file.path (".","UCI HAR Dataset","activity_labels.txt"),stringsAsFactors = F)
setnames(activity_labels,1:2,c("activity.id","activity"))

Y_train<-fread(file.path (".","UCI HAR Dataset","train","Y_train.txt"))
setnames(Y_train,1,c("activity.id"))
setkey(Y_train,activity.id)

Y_test<-fread(file.path (".","UCI HAR Dataset","test","Y_test.txt"))
setnames(Y_test,1,c("activity.id"))
setkey(Y_test,activity.id)

AL<-rbindlist(list(Y_train[activity_labels,roll=TRUE],Y_test[activity_labels,roll=TRUE]))
DT[,activity:=AL$activity]
#print(DT)

#5. From the data set in step 4, creates a second, independent tidy data set 
#	with the average of each variable for each activity and each subject.
#subject_train.txt
subject_train<-fread(file.path (".","UCI HAR Dataset","train","subject_train.txt"))
setnames(subject_train,1,c("subject"))
setkey(subject_train,subject)

subject_test<-fread(file.path (".","UCI HAR Dataset","test","subject_test.txt"))
setnames(subject_test,1,c("subject"))
setkey(subject_test,subject)

SL<-rbindlist(list(subject_train,subject_test))
DT[,subject:=SL$subject]
tidy_data_set<-DT[,lapply(.SD,mean),.(activity,subject)]
write.table(tidy_data_set,"tidy_data_set.txt",row.name=FALSE ) 
#print(tidy_data_set)
