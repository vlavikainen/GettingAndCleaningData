# Code book for UCI_HAR_Summary.txt

## About the data

Original data consists of group of 30 volunteers within an age bracket of 19 - 48 years. Each performed six activities wearing smartphone on the waist. 3-axial linear acceleration and 3-axial angular velocity have captured by accelerometer and gyroscope.

More information on the original data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data is pulled from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Transformations

Only measurements that are averages or standard deviatons are extracted. Variables averaging the signals in a signal window sample and with mean frequencies are dropped even they can be seen as averaging variables. Then average is calculated for each variable by test subject (1 - 30) and activity (walking, walking upstairs, walking downstairs, sitting, standing laying).

Test and and training groups from original data have been merged as is data of the subjects and activities.

Original variable names have been cleaned from special characters.

## Variables

* subject (factor): an identifier (number 1 - 30) for each subject who carried out the experiment (n = 30).

* activity (factor): performed activity:
   1 = walking,
   2 = walkingupstairs,
   3 = walkingdownstairs,
   4 = sitting,
   5 = standing,
   6 = laying,

* variables:
   timeBodyAccXYZ,
   timeGravityAccXYZ,
   timeBodyAccJerkXYZ,
   timeBodyGyroXYZ,
   timeBodyGyroJerkXYZ,
   timeBodyAccMag,
   timeGravityAccMag,
   timeBodyAccJerkMag,
   timeBodyGyroMag,
   timeBodyGyroJerkMag,
   fttBodyAccXYZ,
   fttBodyAccJerkXYZ,
   fttBodyGyroXYZ,
   fttBodyAccMag,
   fttBodyBodyAccJerkMag,
   fttBodyBodyGyroMag,
   fttBodyBodyGyroJerkMag

   All variables are numeric and includes of MeanMean (Mean of the Mean) MeanStd (Mean of the standard deviation), which are calculated means of the means and sd's from the original data. 
   XYZ stands for triazial acceleration (Acc) and angular velocity (Gyro). 
   Time in the begining of variable stands for time domain signals and ftt Fast Fourier Transform.

   More information about the variables can be found from original dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones