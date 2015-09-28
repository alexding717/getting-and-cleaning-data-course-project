library(dplyr)

# Step 1------------------------------------------------------------------------ 
# Merge the training and test sets to create one data set

# Read in data and create the training set
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
training_set <- cbind(train_subject, train_y, train_X)

# Read in data and create the test set
test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_set <- cbind(test_subject, test_y, test_X)

# Merge the training set and test set into one data set
data_All <- rbind(training_set, test_set)

# Step 2------------------------------------------------------------------------
# Extract measurements on the mean and standard deviation for each measurement

feature_names <- read.table("./UCI HAR Dataset/features.txt", as.is =T)

# Get the index of features which contain mean or std
mean_or_std_index <- grep("-(mean|std)\\(\\)", feature_names[, 2]) 

# Get the column index to extract measurements on mean and standard deviation
extract_index <- c(1, 2, mean_or_std_index + 2)

# Extract the needed columns
data_extract <- data_All[, extract_index]

# Step 3------------------------------------------------------------------------
# Uses descriptive activity names to name the activities in the data set

activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt", as.is =T)

# Update the column name
colnames(data_extract)[2] <- "activity"

# Update values with the descriptive activity names
data_extract$activity <- activity_names[data_extract$activity, 2]

# Step 4------------------------------------------------------------------------
# Appropriately label the data set with descriptive variable names

col_num <- length(data_extract)

# Update the column names
colnames(data_extract)[1] <- "subject"
colnames(data_extract)[3:col_num] <-feature_names[mean_or_std_index, 2] 

# Step 5------------------------------------------------------------------------
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

tidy_data <- ddply(data_extract, .(subject, activity), 
                   function(x) colMeans(x[, 3:col_num]))
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
