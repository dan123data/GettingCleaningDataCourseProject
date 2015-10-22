# This is for Course Project for Getting and Cleaning Data 
## This is my pseudo code for how script works

# Step 1: Merges the training and the test sets to create one data set.

## Step 1a: read in activity label file, then rename columns

## Step 1a: read in feature label file, then rename columns

## Step 1b: read in subject file - contains 22 trainign subject IDs associated with 7352 observations

## Step 1c: read in X_train - contains 561 columns of data for 22 training subjects associdated with 7352 observations

## Step 1d: read in activity codes for above observations (6 different codes)

## Step 1e: read in subject file - contains 8 training subject IDs associated with 2947 observations

## Step 1f: read in X_Test - contains 561 columns of data for 8 test subject IDs associated with 2947 observations

## Step 1g: read in activity codes for above observations (6 different codes)

## Step 1h: Create type column with "Test" and "Train" this is for QC steps later

## Step 1i: append test and train files into one 'tall' file 10299 observations by 3 variables

## Step 1j: rename first column to SubjectID and Step 1k Create rowID - this will be used for merging later

## Step 1l: read in activity codes, Step 1m: create row id for merging later

## Step 1n: rename column name

## Step 1o: merge in with activity labels already read in

## Step 1p: append X_test and X_train files into one tall file that is 10299 observations by 562 variables

## Step 1q: Add a row id  for merging purposes later

## Step 1r: Merge data together in 2 stages using the row IDs 

## This creates a file that is is 10299 observations by 566 variables - now lets reduce it down to something
## more manageable and more user friendly

## Step 3.Uses descriptive activity names to name the activities in the data set

## Step 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

## Step 4: Appropriately labels the data set with descriptive variable names. 
## changes Acc to Acceleration, Mag to Magnitude, removes -, (, ) and puts all to lower case

## Step 4: takes out the meanfreq attributes lines

## Step 4: convert subjectid to a factor

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each ##         variable for each activity and each subject.

## Write out to a text file

## print out colNames(DS4) for code book
