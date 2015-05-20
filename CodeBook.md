Information read from files on X_test and X_train were combined in X_merged.

X_merged is processed further to produce X_mean_or_std that contains only variables on measurements on mean and standard deviation of such measured variable.

The original 561 variables of X, after filtering out unnecessary variables, were reduced to 66 variables as shown below:
X_mean_or_std:
 [1] "tBodyAccmeanX"            "tBodyAccmeanY"            "tBodyAccmeanZ"           
 [4] "tBodyAccstdX"             "tBodyAccstdY"             "tBodyAccstdZ"            
 [7] "tGravityAccmeanX"         "tGravityAccmeanY"         "tGravityAccmeanZ"        
[10] "tGravityAccstdX"          "tGravityAccstdY"          "tGravityAccstdZ"         
[13] "tBodyAccJerkmeanX"        "tBodyAccJerkmeanY"        "tBodyAccJerkmeanZ"       
[16] "tBodyAccJerkstdX"         "tBodyAccJerkstdY"         "tBodyAccJerkstdZ"        
[19] "tBodyGyromeanX"           "tBodyGyromeanY"           "tBodyGyromeanZ"          
[22] "tBodyGyrostdX"            "tBodyGyrostdY"            "tBodyGyrostdZ"           
[25] "tBodyGyroJerkmeanX"       "tBodyGyroJerkmeanY"       "tBodyGyroJerkmeanZ"      
[28] "tBodyGyroJerkstdX"        "tBodyGyroJerkstdY"        "tBodyGyroJerkstdZ"       
[31] "tBodyAccMagmean"          "tBodyAccMagstd"           "tGravityAccMagmean"      
[34] "tGravityAccMagstd"        "tBodyAccJerkMagmean"      "tBodyAccJerkMagstd"      
[37] "tBodyGyroMagmean"         "tBodyGyroMagstd"          "tBodyGyroJerkMagmean"    
[40] "tBodyGyroJerkMagstd"      "fBodyAccmeanX"            "fBodyAccmeanY"           
[43] "fBodyAccmeanZ"            "fBodyAccstdX"             "fBodyAccstdY"            
[46] "fBodyAccstdZ"             "fBodyAccJerkmeanX"        "fBodyAccJerkmeanY"       
[49] "fBodyAccJerkmeanZ"        "fBodyAccJerkstdX"         "fBodyAccJerkstdY"        
[52] "fBodyAccJerkstdZ"         "fBodyGyromeanX"           "fBodyGyromeanY"          
[55] "fBodyGyromeanZ"           "fBodyGyrostdX"            "fBodyGyrostdY"           
[58] "fBodyGyrostdZ"            "fBodyAccMagmean"          "fBodyAccMagstd"          
[61] "fBodyBodyAccJerkMagmean"  "fBodyBodyAccJerkMagstd"   "fBodyBodyGyroMagmean"    
[64] "fBodyBodyGyroMagstd"      "fBodyBodyGyroJerkMagmean" "fBodyBodyGyroJerkMagstd"

