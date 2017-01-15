The "data set cleaning and mean calculation project" is part of Coursera Module 3 assignment. For this assignment, Data set is provided which is outcome of experiment on 30 volunters.It had two data sets-Train and Test. 
Train contained 21 subject factors and two data files as X-Train and Y-Train. all the three data sets were in text files.
Test contained similar data set of testers with file names as Subject_test (9 factors),X_test and Y_Test. These files were also in text format.
The base folder also contained 6 activity labels and feature information.

The test data contained mean,standard deviation and other stastical parameters.

As part of project, following steps were performed
a) The test data and train data was  merged along with Subject data. The R code stored the merged data in varable called Combined.
b) From the merged data, mean and standard variable values were extracted. This was stored in variable called Filtered.
c) The data was binded with 6 activities and stored in variable called activities.
d) The data column were renamed by clearly articulating Time,frequency, Mean and standard deviations in the variables. Also, the data on 30 subject records was also merged in file called Cleandata.
e) the average values are calculated for all variables,subjects and activities stored in table. and stored in data table called CleandataMeans with row.names as FALSE. This output table is submissted for evaluation.
