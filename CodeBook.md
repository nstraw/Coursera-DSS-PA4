# Code Book

## Description

This file describes the process of R code contained in [run_analysis.R](./run_analysis.R) file.

The goal of this program is described in the [README.md](./README.md) file.

Information on the input dataset is provided in the [Dataset.md](./Dataset.md) file

## Prerequisites

This program expects Samsung data uncompressed in the working directory.

## Process

#### I. Set Paths

1. get working directory
2. assigns input and output files to variables `path.*`

#### II. Load files into dataframes

1. load reference files into dataframes `features` and `activity`
2. load test data files into dataframes `test.subject`, `test.y` and `test.x`
3. load training data files into dataframes `train.subject`, `train.y` and `train.x`
4. clean feature names `features$name` : lowercase and special characters substitution

#### III. Gather dataframes

1. bind test.subject, test.y and test.x dataframes together, respectively and column-wise, store resulting dataset in `test.data`
2. bind train.subject, train.y and train.x dataframes together, respectively and column-wise, store resulting dataset in `train.data`
3. merge rows from both `test.data` and `train.data` obtained in previous steps, store resulting dataset in `full.data`

#### IV. Adjust variables

1. keep only mean/std variables from `full.data` using `select()` and `matches()` from `dplyr` package, reassign result to `full.data`
2. append activity labels to `full.data` using `merge()`, reassign result to `full.data`
3. order and rename variables tidily using `select()` from `dplyr` package, reassign result to `full.data`

#### V. Aggregate variables

1. average all measurements of `full.data` order by subject and activity, store result to `avg.data`

#### VI. Write output

1. write `avg.data` to `tidy_dataset.txt` in working directory
2. output `avg.data` to console using `data.frame.print`

