#Downloading the all files
test_subjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
train_subjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
X_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
X_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
Y_test <- read.table("UCI HAR Dataset\\test\\Y_test.txt")
Y_train <- read.table("UCI HAR Dataset\\train\\Y_train.txt")

# Transforming all data into data.frames
X_test<- data.frame(X_test)
Y_test<- data.frame(Y_test)
test_subjects <-data.frame(test_subjects)
X_train<- data.frame(X_train)
Y_train<- data.frame(Y_train)
train_subjects <-data.frame(train_subjects)

# Extracting the activity names from activity_labels
Activities <- readLines("UCI HAR Dataset\\activity_labels.txt")
Activities <- substring(Activities,3)
Activities <- as.factor(Activities)


# Extracting the col names for X_train/X_test
Features <- readLines("UCI HAR Dataset\\features.txt")

# Adding col names for X_train
colnames(X_train) <- Features

# Subsetting the X_train with only those col which are associated with Mean and Std
X_train <- X_train[,grep("[Mm]ean|[Ss]td",Features)]

# Adding col names for X_test
colnames(X_test) <- Features

# Subsetting the X_train with only those col which are associated with Mean and Std
X_test <- X_test[,grep("[Mm]ean|[Ss]td",Features)]

# Adding col names for test_subjects
colnames(test_subjects) <- "Subjects"

# Adding col names for train_subjets
colnames(train_subjects) <- "Subjects"

# Adding col names for Y_train 
colnames(Y_train) <- "Activities"

# Adding col names for Y_test 
colnames(Y_test) <- "Activities"

# Adding the Subjects and Activites to X_test
Test <- cbind(test_subjects,X_test,Y_test)

# Adding the Subjects and Activites to X_train
Train <- cbind(train_subjects,X_train,Y_train)

# Merging Test and Train data.
MergedData <- rbind(Test,Train)



