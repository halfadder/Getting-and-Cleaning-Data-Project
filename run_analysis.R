#script assumes that all the relevant files have been placed in the same directory

#function to drop all columns that don't contain certain patterns
keepCol <- function(df, pattern) {
  for(i in names(df)) {
    if(!grepl(pattern, i)) {
      df[i] <- NULL
    }
  }
  return(df)
}

#read the test data into dataframes
x_test <- read.table("X_test.txt")
subjects_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")

#set the column names for each test data frame
features <- read.table("features.txt")
colnames(x_test) <- features$V2

x_test <- keepCol(x_test, "std\\(\\)|mean\\(\\)")

colnames(subjects_test) <- "subject"
colnames(y_test) <- "activity"

#column bind the test dataset together
test <- cbind(subjects_test, x_test, y_test)

#follow the above procedure for the training dataset
x_train <- read.table("X_train.txt")
subjects_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")

colnames(x_train) <- features$V2

x_train <- keepCol(x_train, "std\\(\\)|mean\\(\\)")

colnames(subjects_train) <- "subject"
colnames(y_train) <- "activity"

train <- cbind(subjects_train, x_train, y_train)

#row bind the two datasets together
dat <- rbind(test, train)

#get the activity labels
activity_labels <- read.table("activity_labels.txt")

#factor numeric activity labels into categorical text labels
dat$activity <- factor(dat$activity, labels = activity_labels$V2)

#convert to data table for processing and write speed
library(data.table)
DT <- data.table(dat)
#group by subject and activity, calculate the mean for each feature variable
tidy_dat <- DT[ , lapply(.SD, function(x) mean(x)), .SDcols = names(x_train), by = list(subject, activity)]
tidy_dat <- tidy_dat[order(subject, activity)]

#write the tidy data set
write.csv(tidy_dat, file = "human_activity_recognition_tidy.txt")

#do some more tests here to make sure
summary(subset(dat, dat$activity == "WALKING" & dat$subject == 5))
summary(subset(dat$"tGravityAcc-std()-X", dat$activity == "SITTING" & dat$subject == 30))

summary(subset(dat, dat$activity == "WALKING_DOWNSTAIRS" & dat$subject == 29))