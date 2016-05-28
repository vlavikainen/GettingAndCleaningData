# Getting and Cleaning Data Course Project
This repository contains my submission of the Coursera "Getting and Cleaning Data" course project.
## Files

*`<README.md>` Information about this repository
*`<UCI_HAR_Summary.txt>` Data set which contains summary of the Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Summary consists original data grouped by each subject and their activities with mean of the means and standard deviations of the original variables.
*`<CodeBook.md>` Information on the variables of the data set
*`<run_analysis.R>` R script which creates data in UCI_HAR_Summary.txt (see Summary of the script for more information)

## Summary of the script

`<run_analysis.R>` first downloads original data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzips it to current working directory. Then script merges the train and test datasets with the data of test subjects and activities. Only variables with the means and standard deviations are extracted. After that train and test data is merged.

Summary of the data is made by grouping data by 1) test subject (n=30) and 2) activity (walking, walking upstairs, walking downstairs, sitting, standing laying) and counting mean of the each mean and standard deviation variable. Finally summary data is written to a file.

Script requires dplyr package.

For more information of the original data, see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.