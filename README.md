# Getting and Cleaning Data Course Project
This repo is for the course project of Getting and Cleaning Data on Coursera.

## Data Source

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data used for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Files

This repo contains the following files and folders.

`README.md`is the README file for this repo.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analysis described as below. It can be launched in RStudio by just sourcing the script file. You need to download the data from the url listed above and extract the zip file into your R working directory.

`tidy_data.txt` is the output from launching the scirpt `run_analysis.R`.

## Analysis Description

`run_analysis.R` conducts the following analysis.

* Step 1: "Merges the training and the test sets to create one data set."

* Step 2: "Extracts only the measurements on the mean and standard deviation for each measurement."

* Step 3: "Uses descriptive activity names to name the activities in the data set."

* Step 4: "Appropriately labels the data set with descriptive activity names." 

* Step 5: "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."
