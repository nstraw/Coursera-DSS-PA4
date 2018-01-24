---
title: "Dataset"
---

## Dataset information

* download link :  [dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* description : [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* content :

- `README.txt` : description of this dataset
- `features_info`.txt : information about the selected 561 features and their measurement/calculation methods
- `features.txt` : list of the 561 features contained in this dataset (format : fixed-width, one-space separated)
- `activity_labels.txt` : list of activities id and label (format : fixed-width, one-space separated)

- `train/subject_train.txt` : each row identifies the subject of the training set who performed the activity (range is from 1 to 30)
- `train/X_train.txt`(*) : each row contains the 561 measures for the training set (format : fixed-width, one-space separated)
- `train/y_train.txt` : each row identifies the activity performed by the subject of the training set (range is from 1 to 6)

- `test/subject_test.txt` : each row identifies the subject of the test set who performed the activity (range is from 1 to 30)
- `test/X_test.txt`(*) : each row contains the 561 measures for the test set (format : fixed-width, 1 field=16 characters, one-space separated)
- `test/y_test.txt` : each row identifies the activity performed by subject of the test set (range is from 1 to 6)

(*) the format of X_test.txt and X_train.txt is :
- format : fixed-width 
- 1 field = 16 characters : 
-- 1st character = space
-- 2nd character = space for positive numbers or - (minus) for negative numbers
- number format : exponential (ex: -1.7637793e-002)
