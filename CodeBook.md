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

The following variables all appear in the tidy dataset. The feature variables are all mean or standard deviation measurements.

Note: For detailed technical descriptions of the variables, see features_info.txt in the original ZIP file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

#### subject

The identity code for the subject performing the activity (ranges from 1 to 30).

#### activity

The activity being performed. One of the following factor levels:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

#### tBodyAcc

Time domain body acceleration signal from accelerometer. There are measurements for the X, Y, and Z axes for both mean and standard deviation.

#### tGravityAcc

Time domain gravity acceleration signal from accelerometer. There are measurements for the X, Y, and Z axes for both mean and standard deviation.

#### tBodyAccJerk

Time domain body jerk signal from accelerometer. There are measurements for the X, Y, and Z axes for both mean and standard deviation.
   
#### tBodyGyro

Time domain body signal (angular velocity) from gyroscope. There are measurements for the X, Y, and Z axes for both mean and standard deviation.

#### tBodyGyroJerk

Time domain body jerk signal from gyroscope. There are measurements for the X, Y, and Z axes for both mean and standard deviation.

#### tBodyAccMag

Magnitude of three-dimensional body acceleration signal. There are variables for both mean and standard deviation.

#### tGravityAccMag 

Magnitude of three-dimensional gravity acceleration signal. There are variables for both mean and standard deviation.

#### tBodyAccJerkMag

Magnitude of three-dimensional body jerk signal from accelerometer. There are variables for both mean and standard deviation.

#### tBodyGyroMag

Magnitude of three-dimensional body gyroscope signal. There are variables for both mean and standard deviation.
         
#### tBodyGyroJerkMag

Magnitude of three-dimensional body jerk signal from gyroscope. There are variables for both mean and standard deviation.

#### fBodyAcc

Fast Fourier Transform (FFT) applied to tBodyAcc. There are measurements for the X, Y, and Z axes for both mean and standard deviation.

#### fBodyAccJerk

FFT applied to tBodyAccJerk. There are measurements for the X, Y, and Z axes for both mean and standard deviation.

#### fBodyGyro      

FFT applied to tBodyGyro. There are measurements for the X, Y, and Z axes for both mean and standard deviation.

#### fBodyAccMag

FFT applied to tBodyAccMag. There are measurements for both mean and standard deviation.

#### fBodyBodyAccJerkMag

FFT applied to tBodyAccJerkMag. There are measurements for both mean and standard deviation.

#### fBodyBodyGyroMag

FFT applied to tBodyGyroMag. There are measurements for both mean and standard deviation.

#### fBodyBodyGyroJerkMag

FFT applied to tBodyGyroJerkMag. There are measurements for both mean and standard deviation.