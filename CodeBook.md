## Data

The data was originally collected from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The following is a description of the dataset from its original collectors:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

"For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."

The following files are relevant to this project:

- 'features.txt': A list of all the feature variables. See the Variables section below for more information.
- 'activity_labels.txt': The descriptive labels that can replace the integer values in y_test.txt or y_train.txt.
- 'X_train.txt': The training set (feature measurements).
- 'y_train.txt': The training labels that match up with the activities in activity_labels.txt (range from 1 to 6).
- 'X_test.txt': The test set.
- 'test/y_test.txt': The test labels.
- 'subject_train.txt': Each row is a different training subject who was performing the given activity corresponding to the same row in y_train.txt (range from 1 to 30).
- 'subject_test.txt': Same as above but for subjects in the test group.

## Transformations

The following required files were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracted to the working directory:

- X_test.txt
- subject_test.txt
- y_test.txt
- X_train.txt
- subject_train.txt
- y_train.txt
- features.txt
- activity_labels.txt.

After the above files were read, the column names for the X_test data frame were set using features.txt.

Only columns pertaining to mean and standard deviation measurement features were retained for the X_test dataset. The keepCol function was used to keep only these columns by dropping any columns that had names not matching a regular expression supplied to the function.

The column names for the subject (subjects_test) and activity (y_test) data frames were set accordingly.

cbind was then used to join all the test data frames (subjects_test, x_test, and y_test) together.

The same procedure was also followed for the training dataset.

Both datasets (test and train) were then concatenated together using rbind.

The activity labels were read in from activity_labels.txt. The numeric activity labels in the combined dataset were factored into categorical text labels (e.g., WALKING).

The data frame was converted into a data table for faster processing and writing.

A tidy dataset was created by calculating the mean for each feature variable grouped by subject and activity. lapply was used to accomplish this.

Finally, the tidy dataset was written to human_activity_recognition_tidy.txt.

## Variables

The following variables all apear in the tidy dataset. The feature variables are all mean or standard deviation measurements.

### subject 2
&nbsp;&nbsp;The code for the subject performing the activity.
&nbsp;&nbsp;&nbsp;&nbsp;01..30 Unique subject identifier.

### activity
&nbsp;&nbsp;The acivity being performed. One of the following factor levels:
&nbsp;&nbsp;&nbsp;&nbsp;- WALKING
&nbsp;&nbsp;&nbsp;&nbsp;- WALKING_UPSTAIRS
&nbsp;&nbsp;&nbsp;&nbsp;- WALKING_DOWNSTAIRS
&nbsp;&nbsp;&nbsp;&nbsp;- SITTING
&nbsp;&nbsp;&nbsp;&nbsp;- STANDING
&nbsp;&nbsp;&nbsp;&nbsp;- LAYING

### tBodyAcc-mean()-X
### tBodyAcc-mean()-Y
### tBodyAcc-mean()-Z

### tBodyAcc-std()-X
### tBodyAcc-std()-Y
### tBodyAcc-std()-Z

### tGravityAcc-mean()-X
### tGravityAcc-mean()-Y
### tGravityAcc-mean()-Z

### tGravityAcc-std()-X
### tGravityAcc-std()-Y
### tGravityAcc-std()-Z

"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"

"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
   
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"

"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"          
"tBodyGyro-std()-Z"

"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"

"tBodyGyroJerk-std()-X"     
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"

"tBodyAccMag-mean()"
"tBodyAccMag-std()"

"tGravityAccMag-mean()"      
"tGravityAccMag-std()"

"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"

"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
         
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"

"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
          
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"

"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"      
"fBodyAccJerk-mean()-Z"

"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"

"fBodyGyro-mean()-X"         
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"

"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"

          
"fBodyAccMag-mean()"
"fBodyAccMag-std()"

"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"

"fBodyBodyGyroMag-mean()"   
"fBodyBodyGyroMag-std()"

"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()" 