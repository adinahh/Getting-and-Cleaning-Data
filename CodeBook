The script CleaningDataProject.R does the five tasks in this week's project.

The rbind() function is used to merge data that have the same number of columns and refer to the same entities. 
After that, the mean and standard deviation columns were extracted from the dataset. After extracting these columns, they are given renamed using data from features.txt.
The activity names and IDs were taken from activity_labels.txt and substituted in the dataset.
Columns with vague column names were updated.
In the end, a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows) was created. The output file is called DataTable.txt and is in the original submission.
Variables

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
all_data merges x_data, y_data and subject_data in a big dataset.
Finally, DataTable contains the relevant averages which was stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
