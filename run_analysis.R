##
## run_analysis.R
## Ferdinand DeRamos
## 2015-05-17
##
## R script that merges the training and test data to create one data set.
##   It then extracts only the measurements on mean and standard deviation for each 
##   measured features.
##   Activities in the data set are given descriptive names.
##   Variable names are labeled descriptively.
##   A second independent and tidy data set is created using the average value 
##   of each variable for each activity and each subject.

require(data.table)

## Read X_train and X_test files and merge them.
X_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
X_test  <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
X_merged <- rbind(X_train, X_test)

## Read y_train and y_test files and merge them.
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
y_test  <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
y_merged <- rbind(y_train, y_test)

## Read subject_train and subject_test files and merge them.
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
subject_test  <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
subject_merged <- rbind(subject_train, subject_test)


## Read features file.
features <- read.table("./UCI_HAR_Dataset/features.txt")

## Extract only the measurements on mean and standard deviation for each 
## measured features.
mean_or_std_features <- grep("-mean[(][)]|-std[(][)]", features[, 2])
X_mean_or_std <- X_merged[, mean_or_std_features]
names(X_mean_or_std) <- features[mean_or_std_features, 2]
names(X_mean_or_std) <- gsub("[(][])]", "", names(X_mean_or_std))
names(X_mean_or_std) <- gsub("\\-", "", names(X_mean_or_std))

## Read the activity_labels file.
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")

## Translate y_merged from its current information to corresponding activity label.
y_merged[, 1] = activity_labels[y_merged[, 1], 2]

## Change the name of y_merged's only field to descriptive "Activity"
names(y_merged) <- "Activity"

## Change the name of subject_merged's only field to descriptive "Subject"
names(subject_merged) <- "Subject"

## Column bind subject, y and X datasets.
data_final <- cbind(subject_merged, y_merged, X_mean_or_std)

## Save data_final dataset in a text file.
write.table(data_final, "./UCI_HAR_Dataset/data_final.txt")

## Using data_final, generate a second, independent tidy data set with the average of
## each variable for each activity and each subject.

data_table <- data.table(data_final)
setkey(data_table, Subject, Activity)

data_frame <- data_table[, list(

tBodyAccmeanX = mean(tBodyAccmeanX),    
tBodyAccmeanY = mean(tBodyAccmeanY),    
tBodyAccmeanZ = mean(tBodyAccmeanZ),    
tBodyAccstdX = mean(tBodyAccstdX),    
tBodyAccstdY = mean(tBodyAccstdY),    
tBodyAccstdZ = mean(tBodyAccstdZ),    
tGravityAccmeanX = mean(tGravityAccmeanX),    
tGravityAccmeanY = mean(tGravityAccmeanY),    
tGravityAccmeanZ = mean(tGravityAccmeanZ),    
tGravityAccstdX = mean(tGravityAccstdX),    
tGravityAccstdY = mean(tGravityAccstdY),    
tGravityAccstdZ = mean(tGravityAccstdZ),
tBodyAccJerkmeanX = mean(tBodyAccJerkmeanX),    
tBodyAccJerkmeanY = mean(tBodyAccJerkmeanY),    
tBodyAccJerkmeanZ = mean(tBodyAccJerkmeanZ),    
tBodyAccJerkstdX = mean(tBodyAccJerkstdX),    
tBodyAccJerkstdY = mean(tBodyAccJerkstdY),    
tBodyAccJerkstdZ = mean(tBodyAccJerkstdZ),    
tBodyGyromeanX = mean(tBodyGyromeanX),    
tBodyGyromeanY = mean(tBodyGyromeanY),    
tBodyGyromeanZ = mean(tBodyGyromeanZ),    
tBodyGyrostdX = mean(tBodyGyrostdX),    
tBodyGyrostdY = mean(tBodyGyrostdY),    
tBodyGyrostdZ = mean(tBodyGyrostdZ),    
tBodyGyroJerkmeanX = mean(tBodyGyroJerkmeanX),    
tBodyGyroJerkmeanY = mean(tBodyGyroJerkmeanY),    
tBodyGyroJerkmeanZ = mean(tBodyGyroJerkmeanZ),    
tBodyGyroJerkstdX = mean(tBodyGyroJerkstdX),    
tBodyGyroJerkstdY = mean(tBodyGyroJerkstdY),    
tBodyGyroJerkstdZ = mean(tBodyGyroJerkstdZ),    
tBodyAccMagmean = mean(tBodyAccMagmean),    
tBodyAccMagstd = mean(tBodyAccMagstd),    
tGravityAccMagmean = mean(tGravityAccMagmean),    
tGravityAccMagstd = mean(tGravityAccMagstd),    
tBodyAccJerkMagmean = mean(tBodyAccJerkMagmean),    
tBodyAccJerkMagstd = mean(tBodyAccJerkMagstd),
tBodyGyroMagmean = mean(tBodyGyroMagmean),    
tBodyGyroMagstd = mean(tBodyGyroMagstd),    
tBodyGyroJerkMagmean = mean(tBodyGyroJerkMagmean),    
tBodyGyroJerkMagstd = mean(tBodyGyroJerkMagstd),    
fBodyAccmeanX = mean(fBodyAccmeanX),    
fBodyAccmeanY = mean(fBodyAccmeanY),    
fBodyAccmeanZ = mean(fBodyAccmeanZ),    
fBodyAccstdX = mean(fBodyAccstdX),    
fBodyAccstdY = mean(fBodyAccstdY),    
fBodyAccstdZ = mean(fBodyAccstdZ),    
fBodyAccJerkmeanX = mean(fBodyAccJerkmeanX),    
fBodyAccJerkmeanY = mean(fBodyAccJerkmeanY),    
fBodyAccJerkmeanZ = mean(fBodyAccJerkmeanZ),    
fBodyAccJerkstdX = mean(fBodyAccJerkstdX),    
fBodyAccJerkstdY = mean(fBodyAccJerkstdY),    
fBodyAccJerkstdZ = mean(fBodyAccJerkstdZ),    
fBodyGyromeanX = mean(fBodyGyromeanX),    
fBodyGyromeanY = mean(fBodyGyromeanY),    
fBodyGyromeanZ = mean(fBodyGyromeanZ),    
fBodyGyrostdX = mean(fBodyGyrostdX),    
fBodyGyrostdY = mean(fBodyGyrostdY),    
fBodyGyrostdZ = mean(fBodyGyrostdZ),    
fBodyAccMagmean = mean(fBodyAccMagmean),    
fBodyAccMagstd = mean(fBodyAccMagstd),    
fBodyBodyAccJerkMagmean = mean(fBodyBodyAccJerkMagmean),    
fBodyBodyAccJerkMagstd = mean(fBodyBodyAccJerkMagstd),
fBodyBodyGyroMagmean = mean(fBodyBodyGyroMagmean),    
fBodyBodyGyroMagstd = mean(fBodyBodyGyroMagstd),    
fBodyBodyGyroJerkMagmean = mean(fBodyBodyGyroJerkMagmean),    
fBodyBodyGyroJerkMagstd = mean(fBodyBodyGyroJerkMagstd)    ), 

by=list(Subject, Activity)]    

data_frame <- data.frame(data_frame)

rm(data_table)

## Save the tidy dataset.
write.table(data_frame, "./UCI_HAR_Dataset/data_frame_mean.txt")
