---
title: "README.md"
author: "J.S."
date: "June 20, 2015"
output: html_document
---

#Human Activity Recognition Using Smartphones - Tidy Data

The objective of this project is to gather data from a public database of the University of California and perform some
cleaning and tidying.

The data collected contains information about different sensor readings of a Galaxy Samsung. The experiment used 30 test subjects performing 6 different types of activities: laying, sitting, standing, walking, walking downstairs, walking upstairs.

The original data can be obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

To perform the analysis:

```
source("run_analysis.r")
run_analysis()
```

*-Make sure you have an internet connection.*

The following steps will be performed by the script:

1. Check if **dplyr** package is installed. If not it will be downloaded
2. Download the original data if it has not been downloaded previously. A folder named *"UCI HAR Dataset"* will be created
3. Load original variable names from the file **features.txt**
4. From the original variable names, extract the list of variable names and indices that contain the strings *"mean()"* or *"std()"*.
5. Remove strange characters from variable names *("(",")","-",etc)*
6. Load list of activities from **activities.txt** and convert them to lowercase
7. Load training and test data sets from **/train** and **/test** folders
  * **X_train.txt**
  * **y_train.txt**
  * **subject_train.txt**
  * **X_test.txt**
  * **y_test.txt**
  * **subject_test.txt**
8. Merge the data (concatenating columns from **X**, **y**, and **subject**, and merging rows from **train** and **test** data sets)
9. Group the data set by **subject** and **activity**
10. Calculate the mean for each additional variable and append the text *"average_"* to the beginning of each name
11. Save the new data set into a file called **"tidy.txt"**

Information of all the new variables in the data set can be found in the file **CodeBook.md**