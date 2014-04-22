Getting and Cleaning Data Project
=================================

## Human Activity Recognition Using Smartphones

The run_analysis.R script takes the relevant files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip related to human activity recognition based on smartphone data and reads them into a set of data frames (one set for test data and one set for training data). It is assumed that all of the relevant files have been extracted to the working directory. The needed data files are X_test.txt, subject_test.txt, y_test.txt, X_train.txt, subject_train.txt, y_train.txt, features.txt, and activity_labels.txt.

The data frames are appropriately joined, cleaned, labeled with column names, and then combined together into one large dataset for both training and test data. Only columns pertaining to mean or standard deviation measurement features are retained. The activity integer labels are replaced with categorically descriptive activity names (e.g., WALKING). Finally, the data frame is converted into a data table that calculates the mean for each feature variable grouped by activity and subject. This data table is then written into a tidy dataset: human_activity_recognition_tidy.txt.

CodeBook.md is a code book that describes the data, the variables, and transformations performed to clean up the data.