library(plyr)

# Step 1) Load and merge the data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Create data set "x"
x_data <- rbind(x_train, x_test)

# Create data set "y"
y_data <- rbind(y_train, y_test)

# Create data set "subject"
subject_data <- rbind(subject_train, subject_test)

#Step 2) Pull the mean and standard deviation
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

#Step 3) Name the activities
activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

#Step 4) Label the data
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

#Step 5) Average of each variable for each activity in the data set
# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
