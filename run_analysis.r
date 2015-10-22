# This is for Course Project for Getting and Cleaning Data 

# Step 1: Merges the training and the test sets to create one data set.

# Step 1a: read in activity label file
setwd("C://Users//Dan_Wolf//Documents//DataScience//JHU3_DataClean//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//")
activitylabels<-read.table("activity_labels.txt",header=FALSE)
# Step 1a: then rename columns
names(activitylabels)[1]<-paste("activitycode")
names(activitylabels)[2]<-paste("activitylabel")
# Step 1a: read in feature label file
setwd("C://Users//Dan_Wolf//Documents//DataScience//JHU3_DataClean//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//")
featureslabels<-read.table("features.txt",header=FALSE)
# Step 1a: then rename columns
names(featureslabels)[1]<-paste("featurecol")
names(featureslabels)[2]<-paste("featurelabel")

# Step 1b: read in subject file - contains 22 trainign subject IDs associated with 7352 observations
setwd("C://Users//Dan_Wolf//Documents//DataScience//JHU3_DataClean//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//")
subjecttrain<-read.table("subject_train.txt",header=FALSE)

# Step 1c: read in X_train - contains 561 columns of data for 22 training subjects associdated with 7352 observations
xtrain<-read.table("X_train.txt",header=FALSE)

# Step 1d: read in activity codes for above observations (6 different codes)
ytrain<-read.table("y_train.txt",header=FALSE)

# Step 1e: read in subject file - contains 8 training subject IDs associated with 2947 observations
setwd("C://Users//Dan_Wolf//Documents//DataScience//JHU3_DataClean//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//")
subjecttest<-read.table("subject_test.txt",header=FALSE)

# Step 1f: read in X_Test - contains 561 columns of data for 8 test subject IDs associated with 2947 observations
xtest<-read.table("X_test.txt",header=FALSE)

# Step 1g: read in activity codes for above observations (6 different codes)
ytest<-read.table("y_test.txt",header=FALSE)  

# Step 1h: Create type column with "Test" and "Train" this is for QC steps later
subjecttest$type<-"Test"
subjecttrain$type<-"Train"

# Step 1i: append test and train files into one 'tall' file 10299 observations by 3 variables
subject<-rbind(subjecttest,subjecttrain)

# Step 1j: rename first column to SubjectID
names(subject)[1]<-paste("subjectid")

# Step 1k: Create rowID - this will be used for merging later
subject$rowid<-1:nrow(subject)

# Step 1l: read in activity codes
activitycodes<-rbind(ytest,ytrain)

# Step 1m: create row id for merging later
activitycodes$rowid<-1:nrow(activitycodes)

# Step 1n: rename column name
names(activitycodes)[1]<-paste("activitycode")

# Step 1o: merge in with activity labels already read in
activitycodeslabels<-merge(activitycodes,activitylabels,by="activitycode")

# Step 1p: append X_test and X_train files into one tall file that is 10299 observations by 562 variables
x<-rbind(xtest,xtrain)

# Step 1q: Add a row id  for merging purposes later
x$rowid<-1:nrow(subject)

# Step 1r: Merge data together in 2 stages using the row IDs 
ds<-merge(subject,activitycodeslabels,id="rowid")
ds1<-merge(ds,x,id="rowid")

# This creates a file that is is 10299 observations by 566 variables - now lets reduce it down to something
# more manageable and more user friendly


# Step 3.Uses descriptive activity names to name the activities in the data set
for (i in 6:566)
{
  names(ds1)[i]<-paste(featureslabels[i-5,2])
}

# Step 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
ds2<-cbind(ds1[c(1:5)],ds1[,grep("mean()",names(ds1))],ds1[,grep("std()",names(ds1))])

# Step 4: Appropriately labels the data set with descriptive variable names. 
# changes Acc to Acceleration, Mag to Magnitude, removes -, (, ) and puts all to lower case

for (i in 1:ncol(ds2))
{
  names(ds2)[i]<-gsub("Acc","Acceleration",names(ds2[i]))
  names(ds2)[i]<-gsub("Mag","Magnitude",names(ds2[i]))
  names(ds2)[i]<-gsub("-","",names(ds2[i]))
  names(ds2)[i]<-gsub(')','',names(ds2[i]))
  names(ds2)[i]<-gsub('\\(','',names(ds2[i]))
  names(ds2)[i]<-tolower(names(ds2[i]))
}

# Step 4: takes out the meanfreq attributes lines
ds3<-cbind(ds2[,-grep("meanfreq",names(ds2))])

# Step 4: convert subjectid to a factor
ds3$subjectid<-as.factor(ds3$subjectid)

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity 
#and each subject.

library(dplyr)
ds3[,c("rowid","type","activitycode")]<-list(NULL)
ds4<- ds3 %>% group_by(subjectid,activitylabel) %>% summarise_each(funs(mean))

# Write out to a text file
setwd("C://Users//Dan_Wolf//Documents//DataScience//JHU3_DataClean//")
write.table(ds4,file="ds4.txt",row.name=FALSE)

colnames(ds4)

