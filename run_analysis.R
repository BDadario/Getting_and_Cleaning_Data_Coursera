setwd("~/R_Class/data")
# Read Training Data into R
train = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)


# Read Test Data into R
test = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# Read features Data into R, make the feature names better suited name substitutions
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Read in the Activity Labes file.
activitylabel = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Merge (stack) Training and Test Data sets together so you have one Data set.
mergedata = rbind(train, test)

# Get only the data for the mean and std. dev. (stanard deviation)
colsneeded <- grep(".*Mean.*|.*Std.*", features[,2])

# Next step is reduce the features table to only the information we need.
features <- features[colsneeded,]

# Add the last two columns which are the subject and activity data from Training and Test data sets.
colsneeded <- c(colsneeded, 562, 563)

# Now remove the unwanted columns from mergedata set.
mergedata <- mergedata[,colsneeded]

# Add the columns using the features data set to the mergedata set. 
# Plus add on Activiy and Subject column headings.
colnames(mergedata) <- c(features$V2, "Activity", "Subject")

# Alter all the column names to lower case.
colnames(mergedata) <- tolower(colnames(mergedata))

# Loop through the data set to apply activity lables to the "Activity" column
currentactivity = 1
for (currentactivitylabel in activitylabel$V2) {
  mergedata$activity <- gsub(currentactivity, currentactivitylabel, mergedata$activity)
  currentactivity <- currentactivity + 1
}

# Alter the data to a factor
mergedata$activity <- as.factor(mergedata$activity)
mergedata$subject <- as.factor(mergedata$subject)

tidy = aggregate(mergedata, by=list(activity = mergedata$activity, subject=mergedata$subject), mean)
# Remove the subject and activity columns because the mean data of these two columns are meanlingless.
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.csv", sep=",")

