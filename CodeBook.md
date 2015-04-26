#codebook.

## Data preparation
data source  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
downloaded and unziped in to current directory  

## Data transformation 
1.	From data sets extracted only mean() and std() features 
2.	Datasets expanded by corresponding activity and subject
3.	Both test and train datasets joined  
4.	Then aggregated by activity , subject using average values 


## data  description :	180 obs. of  69 variables:
 * activity.id                : num  corresponding Training labels from  `y_train.txt` or `y_ test.txt` 
 * activity                   : chr  from `activity_labels.txt` added using corresponding activity.id
 * subject                    : int  corresponding `'train/subject_train.txt'`: Each row identifies the subject who performed the activity for each window sample. 
 * tBodyAcc.mean...X          : num  Average values of combined data set by activity and subject 
 * tBodyAcc.mean...Y          : num  ---""----
 * tBodyAcc.mean...Z          : num  ---""----
 * tBodyAcc.std...X           : num  ---""----
 * tBodyAcc.std...Y           : num  ---""----
 * tBodyAcc.std...Z           : num  ---""----
 * tGravityAcc.mean...X       : num  ---""----
 * tGravityAcc.mean...Y       : num  ----""----
 * tGravityAcc.mean...Z       : num  ----""----
 * tGravityAcc.std...X        : num  ---""----
 * tGravityAcc.std...Y        : num  ----»«----
 * tGravityAcc.std...Z        : num  ----»«----
 * tBodyAccJerk.mean...X      : num  ----»«----
 * tBodyAccJerk.mean...Y      : num  ----»«----
 * tBodyAccJerk.mean...Z      : num  ----»«----
 * tBodyAccJerk.std...X       : num  ----»«----
 * tBodyAccJerk.std...Y       : num  ----»«----
 * tBodyAccJerk.std...Z       : num  ----»«----
 * tBodyGyro.mean...X         : num  ----»«----
 * tBodyGyro.mean...Y         : num  ----»«----
 * tBodyGyro.mean...Z         : num  ----»«----
 * tBodyGyro.std...X          : num  ----»«----
 * tBodyGyro.std...Y          : num  ----»«----
 * tBodyGyro.std...Z          : num  ----»«----
 * tBodyGyroJerk.mean...X     : num  ----»«----
 * tBodyGyroJerk.mean...Y     : num  ----»«----
 * tBodyGyroJerk.mean...Z     : num  ----»«----
 * tBodyGyroJerk.std...X      : num  ----»«----
 * tBodyGyroJerk.std...Y      : num  ----»«----
 * tBodyGyroJerk.std...Z      : num  ----»«----
 * tBodyAccMag.mean..         : num  ----»«----
 * tBodyAccMag.std..          : num  ----»«----
 * tGravityAccMag.mean..      : num  ----»«----
 * tGravityAccMag.std..       : num  ----»«----
 * tBodyAccJerkMag.mean..     : num  ----»«----
 * tBodyAccJerkMag.std..      : num  ----»«----
 * tBodyGyroMag.mean..        : num  ----»«----
 * tBodyGyroMag.std..         : num  ----»«----
 * tBodyGyroJerkMag.mean..    : num  ----»«----
 * tBodyGyroJerkMag.std..     : num  ----»«----
 * fBodyAcc.mean...X          : num  ----»«----
 * fBodyAcc.mean...Y          : num  ----»«----
 * fBodyAcc.mean...Z          : num  ----»«----
 * fBodyAcc.std...X           : num  ----»«----
 * fBodyAcc.std...Y           : num  ----»«----
 * fBodyAcc.std...Z           : num  ----»«----
 * fBodyAccJerk.mean...X      : num  ----»«----
 * fBodyAccJerk.mean...Y      : num  ----»«----
 * fBodyAccJerk.mean...Z      : num  ----»«----
 * fBodyAccJerk.std...X       : num  ----»«----
 * fBodyAccJerk.std...Y       : num  ----»«----
 * fBodyAccJerk.std...Z       : num  ----»«----
 * fBodyGyro.mean...X         : num  ----»«----
 * fBodyGyro.mean...Y         : num  ----»«----
 * fBodyGyro.mean...Z         : num  ----»«----
 * fBodyGyro.std...X          : num  ----»«----
 * fBodyGyro.std...Y          : num  ----»«----
 * fBodyGyro.std...Z          : num  ----»«----
 * fBodyAccMag.mean..         : num  ----»«----
 * fBodyAccMag.std..          : num  ----»«----
 * fBodyBodyAccJerkMag.mean.. : num  ----»«----
 * fBodyBodyAccJerkMag.std..  : num  ----»«----
 * fBodyBodyGyroMag.mean..    : num  ----»«----
 * fBodyBodyGyroMag.std..     : num  ----»«----
 * fBodyBodyGyroJerkMag.mean..: num  ----»«----
 * fBodyBodyGyroJerkMag.std.. : num  ----»«----
 

