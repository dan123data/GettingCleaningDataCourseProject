
# Codebook for Getting and Cleaning Data Course Project

# Overview: 

Readin, assemble, select, summarize then output desired fields for a set of accelerometer data from a cellphone worn on a belt while a person is doing various activities.   

# Raw data files: 

  'features_info.txt': Shows information about the variables used on the feature vector.
  
  'features.txt': List of all features.
  
  'activity_labels.txt': Links the class labels with their activity name.
  
  'train/X_train.txt': Training set.
  
  'train/y_train.txt': Training labels.
  
  'test/X_test.txt': Test set.
  
  'test/y_test.txt': Test labels.
  
  'train/subject_train.txt': Each row identifies the subject who performed the activity for each window                                  sample. Its range is from 1 to 30. 
  
  'train/Inertial Signals/total acc x train.txt': The acceleration signal from the smartphone accelerometer       X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description            applies for the 'total acc x train.txt' and 'total acc z_train.txt' files for the Y and Z axis. 
  
   'train/Inertial Signals/body acc x_train.txt': The body acceleration signal obtained by subtracting the         gravity from the total acceleration. 
   
  'train/Inertial Signals/body gyro x_train.txt': The angular velocity vector measured by the gyroscope for        each window sample. The units are radians/second. 

# Basic Process: 

## Step 1.Merges the training and the test sets to create one data set.

## Step 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

## Step 3.Uses descriptive activity names to name the activities in the data set

## Step 4.Appropriately labels the data set with descriptive variable names. 

## Step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Codebook: 

Step 1a: Activity labels.txt file did not have column names, code column was called 'activitycode', activity label column was called 'activitylabel', Feature_labels file did not have column names, first column was called 'featurecol', activity label column was called 'featurelabel'

Step 1b:in the subjecttest and subjecttrain files a column was created called 'type' that contained the value 'Test' or 'Train' depending on which file the observation came from

Step 3: the feature labels found in feature labels.txt were assigned to the column names in the DS1 data set

Step 2: all columns with mean() or std() were selected 

Step 4: the following column names were altered in the following way for all columns names: 
  The names of the columns with "Acc" in them were changed to "Acceleration"
  The names of the columns with "Mag" in them were changed to "Magnitude"
  The characters -() were taken out of the column names 
  All names were changed to lower case using the tolower() function
  
  
# Data Dictionary 
## for DS4 DataSet (g = standard gravity units):   
  
 Num Attribute name                       Units 
 
 1 "subjectid"                            char
 
 2 "activitylabel"                        char
 
 3 "tbodyaccelationmeanx"                 g
 
 4 "tbodyaccelationmeany"                 g        
 
 5 "tbodyaccelationmeanz"                 g
 
 6 "tgravityaccelationmeanx"              g
 
 7 "tgravityaccelationmeany"              g
 
 8 "tgravityaccelationmeanz"              g
 
 9 "tbodyaccelationjerkmeanx"             g
 
10 "tbodyaccelationjerkmeany"             g

11 "tbodyaccelationjerkmeanz"             g 

12 "tbodygyromeanx"                       radians/second

13 "tbodygyromeany"                       radians/second

14 "tbodygyromeanz"                       radians/second

15 "tbodygyrojerkmeanx"                   radians/second

16 "tbodygyrojerkmeany"                   radians/second

17 "tbodygyrojerkmeanz"                   radians/second

18 "tbodyaccelationmagnitudemean"         g

19 "tgravityaccelationmagnitudemean"      g

20 "tbodyaccelationjerkmagnitudemean"     g

21 "tbodygyromagnitudemean"               radians/second

22 "tbodygyrojerkmagnitudemean"           radians/second

23 "fbodyaccelationmeanx"                 g

24 "fbodyaccelationmeany"                 g

25 "fbodyaccelationmeanz"                 g

26 "fbodyaccelationjerkmeanx"             g

27 "fbodyaccelationjerkmeany"             g

28 "fbodyaccelationjerkmeanz"             g

29 "fbodygyromeanx"                       radians/second

30 "fbodygyromeany"                       radians/second

31 "fbodygyromeanz"                       radians/second

32 "fbodyaccelationmagnitudemean"         g

33 "fbodybodyaccelationjerkmagnitudemean" g

34 "fbodybodygyromagnitudemean"           radians/second

35 "fbodybodygyrojerkmagnitudemean"       radians/second

36 "tbodyaccelationstdx"                  g

37 "tbodyaccelationstdy"                  g

38 "tbodyaccelationstdz"                  g

39 "tgravityaccelationstdx"               g

40 "tgravityaccelationstdy"               g

41 "tgravityaccelationstdz"               g

42 "tbodyaccelationjerkstdx"              g

43 "tbodyaccelationjerkstdy"              g

44 "tbodyaccelationjerkstdz"              g

45 "tbodygyrostdx"                        radians/second 

46 "tbodygyrostdy"                        radians/second

47 "tbodygyrostdz"                        radians/second

48 "tbodygyrojerkstdx"                    radians/second

49 "tbodygyrojerkstdy"                    radians/second

50 "tbodygyrojerkstdz"                    radians/second

51 "tbodyaccelationmagnitudestd"          g

52 "tgravityaccelationmagnitudestd"       g

53 "tbodyaccelationjerkmagnitudestd"      g

54 "tbodygyromagnitudestd"                radians/second

55 "tbodygyrojerkmagnitudestd"            radians/second

56 "fbodyaccelationstdx"                  g

57 "fbodyaccelationstdy"                  g

58 "fbodyaccelationstdz"                  g

59 "fbodyaccelationjerkstdx"              g

60 "fbodyaccelationjerkstdy"              g

61 "fbodyaccelationjerkstdz"              g

62 "fbodygyrostdx"                        radians/second

63 "fbodygyrostdy"                        radians/second

64 "fbodygyrostdz"                        radians/second

65 "fbodyaccelationmagnitudestd"          g

66 "fbodybodyaccelationjerkmagnitudestd"  g

67 "fbodybodygyromagnitudestd"            radians/second

68 "fbodybodygyrojerkmagnitudestd"        radians/second

  
  


