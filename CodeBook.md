---
title: "CodeBook"
author: "J.S."
date: "June 20, 2015"
output: html_document
---

#Data Sets

---

##Raw Data

*Text taken from the original readme*

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

## Tidy Data

The tidy data set summarizes the average of the mean and standard deviation fields from the raw data set. 

The following steps were taken:

1. Extract the fields that contain "mean()" or "std()" using the following regular expression
```
(mean|std)\\(\\)"
```
2. Replace minus sign with underscore
3. Convert all field names to their lowercase equivalent
4. Load data from **activity_labels.txt** and lowercase them
  * laying 
  * sitting 
  * standing 
  * walking 
  * walking_downstairs 
  * walking_upstairs
5. Append activities and subject information to the data set using the following labels
  * activity
  * subject
6. Summarize the data by averaging all variables while grouping the data set by
  * subject
  * activity
7. Append "average_" to the beginning of each variable name to indicate that now they are storing an averaged value

These are the fields of the tidy dataset:

| Field Name    | Type    |
| ------------- | :------ |
| subject | Integer (values from 1 to 30) |
| activity | Character (laying, sitting, standing, walking, walking_downstairs, walking_upstairs) |
| average_tbodyacc_mean_x | Double (averaged values between -1 and 1)|
| average_tbodyacc_mean_y | Double (averaged values between -1 and 1) |
| average_tbodyacc_mean_z | Double (averaged values between -1 and 1) |
| average_tbodyacc_std_x  | Double (averaged values between -1 and 1) |
| average_tbodyacc_std_y  | Double (averaged values between -1 and 1) |
| average_tbodyacc_std_z | Double (averaged values between -1 and 1) |
| average_tgravityacc_mean_x |  Double (averaged values between -1 and 1) |
| average_tgravityacc_mean_y |  Double (averaged values between -1 and 1) |
| average_tgravityacc_mean_z |  Double (averaged values between -1 and 1) |
| average_tgravityacc_std_x  |  Double (averaged values between -1 and 1) |
| average_tgravityacc_std_y |  Double (averaged values between -1 and 1) |
| average_tgravityacc_std_z |  Double (averaged values between -1 and 1) |
| average_tbodyaccjerk_mean_x |  Double (averaged values between -1 and 1) |
| average_tbodyaccjerk_mean_y |  Double (averaged values between -1 and 1) |
| average_tbodyaccjerk_mean_z |  Double (averaged values between -1 and 1) |
| average_tbodyaccjerk_std_x |  Double (averaged values between -1 and 1) |
| average_tbodyaccjerk_std_y | Double (averaged values between -1 and 1) |
| average_tbodyaccjerk_std_z | Double (averaged values between -1 and 1) |
| average_tbodygyro_mean_x | Double (averaged values between -1 and 1) |
| average_tbodygyro_mean_y | Double (averaged values between -1 and 1) |
| average_tbodygyro_mean_z | Double (averaged values between -1 and 1) |
| average_tbodygyro_std_x | Double (averaged values between -1 and 1) |
| average_tbodygyro_std_y | Double (averaged values between -1 and 1) |
| average_tbodygyro_std_z | Double (averaged values between -1 and 1) |
| average_tbodygyrojerk_mean_x | Double (averaged values between -1 and 1) |
| average_tbodygyrojerk_mean_y | Double (averaged values between -1 and 1) |
| average_tbodygyrojerk_mean_z | Double (averaged values between -1 and 1) |
| average_tbodygyrojerk_std_x | Double (averaged values between -1 and 1) |
| average_tbodygyrojerk_std_y | Double (averaged values between -1 and 1) |
| average_tbodygyrojerk_std_z | Double (averaged values between -1 and 1) |
| average_tbodyaccmag_mean | Double (averaged values between -1 and 1) |
| average_tbodyaccmag_std | Double (averaged values between -1 and 1) |
| average_tgravityaccmag_mean | Double (averaged values between -1 and 1) |
| average_tgravityaccmag_std | Double (averaged values between -1 and 1) |
| average_tbodyaccjerkmag_mean | Double (averaged values between -1 and 1) |
| average_tbodyaccjerkmag_std | Double (averaged values between -1 and 1) |
| average_tbodygyromag_mean | Double (averaged values between -1 and 1) |
| average_tbodygyromag_std | Double (averaged values between -1 and 1) |
| average_tbodygyrojerkmag_mean | Double (averaged values between -1 and 1) |
| average_tbodygyrojerkmag_std | Double (averaged values between -1 and 1) |
| average_fbodyacc_mean_x | Double (averaged values between -1 and 1) |
| average_fbodyacc_mean_y | Double (averaged values between -1 and 1) |
| average_fbodyacc_mean_z | Double (averaged values between -1 and 1) |
| average_fbodyacc_std_x | Double (averaged values between -1 and 1) |
| average_fbodyacc_std_y | Double (averaged values between -1 and 1) |
| average_fbodyacc_std_z | Double (averaged values between -1 and 1) |
| average_fbodyaccjerk_mean_x | Double (averaged values between -1 and 1) |
| average_fbodyaccjerk_mean_y | Double (averaged values between -1 and 1) |
| average_fbodyaccjerk_mean_z | Double (averaged values between -1 and 1) |
| average_fbodyaccjerk_std_x | Double (averaged values between -1 and 1) |
| average_fbodyaccjerk_std_y | Double (averaged values between -1 and 1) |
| average_fbodyaccjerk_std_z | Double (averaged values between -1 and 1) |
| average_fbodygyro_mean_x | Double (averaged values between -1 and 1) |
| average_fbodygyro_mean_y | Double (averaged values between -1 and 1) |
| average_fbodygyro_mean_z | Double (averaged values between -1 and 1) |
| average_fbodygyro_std_x | Double (averaged values between -1 and 1) |
| average_fbodygyro_std_y | Double (averaged values between -1 and 1) |
| average_fbodygyro_std_z | Double (averaged values between -1 and 1) |
| average_fbodyaccmag_mean | Double (averaged values between -1 and 1) |
| average_fbodyaccmag_std | Double (averaged values between -1 and 1) |
| average_fbodybodyaccjerkmag_mean | Double (averaged values between -1 and 1) |
| average_fbodybodyaccjerkmag_std | Double (averaged values between -1 and 1) |
| average_fbodybodygyromag_mean | Double (averaged values between -1 and 1) |
| average_fbodybodygyromag_std | Double (averaged values between -1 and 1) |
| average_fbodybodygyrojerkmag_mean | Double (averaged values between -1 and 1) |
| average_fbodybodygyrojerkmag_std | Double (averaged values between -1 and 1) |

