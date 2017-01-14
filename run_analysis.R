#Downloaded the Zip file and unzip in folder named UCI_HAR_DAtaset
data.dir = path.expand("~/coursework/Datasciencecoursera/Assgn_mod3/UCI_HAR_Dataset")
setwd(data.dir)

# Read and merge Train and Test data
##################################################################################################
        #STEP 1 & 2 : Merging the training and Test sets and Extracting Mean and Std Deviation
#################################################################################################
Train1 <- Test1 <- NULL
if(is.null(Train1)) { Train1 <- read.table("./test/X_test.txt")}
if(is.null(Test1))  { Test1  <- read.table("./train/X_train.txt") }
Combinedx <- rbind(Train1, Test1)
featureNames <- read.table("features.txt")[, 2]
names(Combinedx) <- featureNames
# Extracted  the measurements of the mean and standard deviation for each measurement.
Combined_filtered <- grep("(mean|std)\\(\\)", names(Combinedx))
Filtered <- Combinedx[, Combined_filtered]
##############################################################################################
          #STEP 3: Descriptive activity names and naming activities
##############################################################################################

Train2 <- read.table("./train/y_train.txt")
Test2  <- read.table("./test/y_test.txt")
Combinedy <- rbind(Train2, Test2)[, 1]
activityNames <-
  c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
activities <- activityNames[Combinedy]
##############################################################################################
          #STEP 4: labeling of Data set with descriptive names
##############################################################################################

# Descriptive labeling removing the non descriptive labels

names(Filtered) <- gsub("^t", "Time", names(Filtered))
names(Filtered) <- gsub("^f", "Frequency", names(Filtered))
names(Filtered) <- gsub("-mean\\(\\)", "Mean", names(Filtered))
names(Filtered) <- gsub("-std\\(\\)", "StdDev", names(Filtered))
names(Filtered) <- gsub("-", "", names(Filtered))
names(Filtered) <- gsub("BodyBody", "Body", names(Filtered))
# Add activities and subject with nice names
subjectTrain <- read.table("./train/subject_train.txt")
subjectTest  <- read.table("./test/subject_test.txt")
subjects <- rbind(subjectTrain, subjectTest)[, 1]
cleandata <- cbind(Subject = subjects, Activity = activities, Filtered)

##############################################################################################
        #STEP 5: second independent set with average of each variable/subject/activity
#############################################################################################


library(plyr)

cleandataMeans <- ddply(cleandata, .(Subject, Activity),function(x) colMeans(x[,-c(1,2)]) )
names(cleandataMeans)[-c(1,2)] <- paste0("Mean", names(cleandataMeans)[-c(1,2)])
#Writing to file
write.table(cleandataMeans, "cleandataMeans.txt", row.names = FALSE)

#print file
cleandataMeans

