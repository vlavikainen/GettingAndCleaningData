library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download file and saving date of the download
download.file(fileUrl, destfile = "traindata.zip")
downloadDate <- date()

## unzipping the downloaded file
unzip("traindata.zip")

## Dataset filepath
filepath <- file.path(".", "UCI HAR Dataset")

## reading test set, activities and subjects and binding
## them as one data set
testset <- read.table(file.path(filepath, "test", "X_test.txt"))
activityTest <- read.table(file.path(filepath, "test", "y_test.txt"))
testsubjects <- read.table(file.path(filepath, "test", "subject_test.txt"), colClasses = c("factor"))

testset <- cbind(subject = testsubjects[,1], activity = activityTest[,1], testset)

## reading train set, activities and subjects and binding
## them as one data set
trainset <- read.table(file.path(filepath, "train", "X_train.txt"))
activityTrain <- read.table(file.path(filepath, "train", "y_train.txt"))
trainsubjects <- read.table(file.path(filepath, "train", "subject_train.txt"), colClasses = c("factor"))

trainset <- cbind(subject = trainsubjects[,1], activity = activityTrain[,1], trainset)

## Combining test and train sets
data <- rbind(testset,trainset)

## reading the features file and removing first column
features <- read.table(file.path(filepath, "features.txt"), stringsAsFactors = F)
features <- features[,2]

## getting the indices of the means and the standard deviatons
## and saving only those features.
meansAndStds <- grep("mean[(]|std[(]", features)
features <- features[meansAndStds] 

## removing columns that not include means or standard deviations
## adding one to all indices because first column is activity
data <- data[,c(1, 2, meansAndStds+2)]

## trimming features by removing special characters
## and adding time and ftt. No convert to lower case
## beacause it would make labels less readable.
features <- gsub("_|-|\\(|\\)", "", features)
features <- gsub("^t", "time", features)
features <- gsub("^f", "ftt", features)
features <- gsub("mean", "Mean", features)
features <- gsub("std", "Std", features)

colnames(data) <- c("subject", "activity", features)

## reshaping activity as factor with activity labels
activityLabels <- read.table(file.path(filepath,"activity_labels.txt"), stringsAsFactors = F)
activityLabels <- tolower(gsub("_", "", activityLabels[,2]))
data[,2] <- factor(data[,2], labels = activityLabels)

## Grouping original data set by subject and activity,
## then counting the mean of each variable.
dataSubAct <- data %>% group_by(subject, activity)
dataSubAct <- summarise_each(dataSubAct, funs(mean))

## reshaping levels (mean is mean of the mean and std mean of the std)
names(dataSubAct) <- gsub("Mean", "MeanMean", names(dataSubAct))
names(dataSubAct) <- gsub("Std", "MeanStd", names(dataSubAct))

## Writing data sets to under the directory called data
if(!dir.exists(file.path(".","data")))
        dir.create(file.path(".", "data"))

write.table(dataSubAct, file.path(".", "data", "UCI_HAR_Summary.txt"), row.names = F)