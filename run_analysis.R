# After uploading the ZIP into RStudio
setwd("~/UCI HAR Dataset")
library(dplyr)

# 1) Merge the sets
features <- read.table("features.txt", header = FALSE)

#---
X_train        <- read.table("train/X_train.txt", header = FALSE, 
                             col.names = features$V2)
y_train        <- read.table("train/y_train.txt", header = FALSE,
                             col.names = "activity")
subject_train  <- read.table("train/subject_train.txt",  header = FALSE,
                             col.names = "subject")
train <- cbind(subject_train, y_train, X_train)
# ---
X_test         <- read.table("test/X_test.txt", header = FALSE,
                             col.names = features$V2)
y_test         <- read.table("test/y_test.txt", header = FALSE,
                             col.names = "activity")
subject_test   <- read.table("test/subject_test.txt", header = FALSE,
                             col.names = "subject")
test <- cbind(subject_test, y_test, X_test)
#--- 
complete_data <- rbind(train, test)

# 2) Only keep means and SDs
measurements_to_keep <- grep("mean|std", names(complete_data), ignore.case = TRUE)

relevant_data <- complete_data[, c(1, 2, measurements_to_keep)]

# 3) Rename activities
activity_labels <- read.table("activity_labels.txt",
                              header = FALSE,
                              col.names = c("activity_id", "activity_name"))

relevant_data$activity <- factor(
  relevant_data$activity,
  levels = activity_labels$activity_id,
  labels = activity_labels$activity_name
)

# 4) Improve labels
names(relevant_data) <- gsub("\\()", "", names(relevant_data))
names(relevant_data) <- gsub("^t", "time", names(relevant_data))
names(relevant_data) <- gsub("^f", "frequency", names(relevant_data))
names(relevant_data) <- gsub("Acc", "Accelerometer", names(relevant_data))
names(relevant_data) <- gsub("Gyro", "Gyroscope", names(relevant_data))
names(relevant_data) <- gsub("Mag", "Magnitude", names(relevant_data))
names(relevant_data) <- gsub("\\.mean", "Mean", names(relevant_data))

#5) New data set with just the averages
tidy_data <- relevant_data %>%
  group_by(subject, activity) %>%
  summarize(across(everything(), mean))


write.table(tidy_data, file = "tidy_data_datacleaning_JHU.txt", row.names = FALSE)
