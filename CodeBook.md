### Coursera - Data Science Specialization

Course 04 - Getting and Cleaning Data
Programming Assignment 04

#### Description

This file describes the process of R code contained in [run_analysis.R](./run_analysis.R) file.
The goal of this program is described in the [README.md](./README.md) file.

#### Prerequisites

[run_analysis.R](./run_analysis.R) expects that Samsung data is in the working directory (uncompressed)
> dir()
[1] "activity_labels.txt" "features.txt"        "features_info.txt"  
[4] "README.txt"          "test"                "train"  


#### Input data

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

#### Process

##### Set Paths

1. get working directory
2. assigns input and output files to variables `path.*`

#### Load files into dataframes

1. load reference files : 
* `features.txt` to df `features`, 
* `activity_labels.txt` to df `activity`
* clean the name of the features later used as variable names : lowercase and special characters substitution : parenthesis, hyphen, comma)

2. load data files :
* test : the 3 text files from "./test/" to df `test.subject` (subject ids), `test.y` (activity ids) and `test.x` (measure values)
* train : the 3 text files from "./train/" to df `train.subject` (subject ids), `train.y` (activity ids) and `train.x` (measure values)

#### Gather dataframes

1. bind test.subject, test.y and test.x dataframes together, respectively and column-wise, store resulting dataset in `test.data`
2. bind train.subject, train.y and train.x dataframes together, respectively and column-wise, store resulting dataset in `train.data`
3. merge rows from both test and training dataframes obtained in previous steps 1 and 2, store resulting dataset in `full.data`

#### Adjust variables

1. keep only mean/std variables from `full.data` using `select()` and `matches()` from `dplyr` package, reassign result to `full.data`
2. append activity labels to `full.data` using `merge()`, reassign result to `full.data`
3. order and rename variables tidily using `select()` from `dplyr` package, reassign result to `full.data`

### Aggregate variables

Average all measurements of `full.data` order by subject and activity, store result to `avg.data`

### Write output

1. write `avg.data` to `tidy_dataset.txt` in working directory
2. output `avg.data` to console using data.frame.print


### Author

* N.Straw

### License

No licence