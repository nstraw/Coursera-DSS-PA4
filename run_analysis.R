# load libraries
library(dplyr)

# get working directory
path.folder <- getwd()

# set paths to input/output files
path.features       <- paste(path.folder, "/features.txt", sep = "")
path.train.x        <- paste(path.folder, "/train/X_train.txt", sep = "")
path.train.y        <- paste(path.folder, "/train/y_train.txt", sep = "")
path.train.subject  <- paste(path.folder, "/train/subject_train.txt", sep = "")
path.test.x         <- paste(path.folder, "/test/X_test.txt", sep = "")
path.test.y         <- paste(path.folder, "/test/y_test.txt", sep = "")
path.test.subject   <- paste(path.folder, "/test/subject_test.txt", sep = "")
path.activity       <- paste(path.folder, "/activity_labels.txt", sep = "")
path.tidy.dataset   <- paste(path.folder, "/tidy_dataset.txt", sep = "")

# load reference files to dataframe
features <- read.table(path.features, col.names=c("id", "name"), stringsAsFactors=F)
activity <- read.table(path.activity, col.names=c("id", "name"))

# clean feature names
features$name = tolower(features$name)  # to lower case
features$name = gsub("\\(\\)", "", features$name)  # remove parenthesis ()
features$name = gsub("-|,", ".", features$name)  # replace hyphens - and commas ,

# load data files to dataframe
test.subject <- read.table(path.test.subject, col.names="subject.id")
test.y       <- read.table(path.test.y, col.names="y.id")
test.x       <- read.table(path.test.x, col.names=features$name, check.names=F)

train.subject <- read.table(path.train.subject, col.names="subject.id")
train.y       <- read.table(path.train.y, col.names="y.id")
train.x       <- read.table(path.train.x, col.names=features$name, check.names=F)

# gather test dataset
test.data <- bind_cols(test.subject, test.y, test.x)

# gather training dataset
train.data <- bind_cols(train.subject, train.y, train.x)

# merge training and test datatsets (task #1)
full.data <- bind_rows(train.data, test.data)

# filter mean/std variables (task #2)
full.data <- select(full.data, 1:2, matches("\\.mean\\.|\\.std\\."))

# append activity label by join (task #3)
full.data <- merge(full.data, activity, by.x="y.id", by.y="id")

# order and rename variables (task #4)
full.data <- select(full.data, subject.id, 
                               activity.id=y.id,
                               activity.name=name,
                               everything())

# average all measurements by subject and activity (task #5)
avg.data <- full.data %>%
              group_by(subject.id, activity.id, activity.name) %>%
              summarize_all(mean)

# write dataset to file
write.table(avg.data, path.tidy.dataset, row.name=FALSE)

# write dataset to output
print.data.frame(avg.data)
