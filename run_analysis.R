check_package <- function (package_name)
{
    if (!require(package_name, character.only = TRUE))
    {
        install.packages(package_name)
        require(package_name, require(package_name, character.only = TRUE))
    }
}

download_data <- function ()
{
    message("Downlading data")
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url,"data.zip",method="curl")
    unzip("data.zip")
}

load_data <- function (dir, featIndices, featNames, activities)
{
    x <- read.table(paste0(dir,"/X_",dir,".txt"))
    y <- read.table(paste0(dir,"/y_",dir,".txt"))
    subject <- read.table(paste0(dir,"/subject_",dir,".txt"))
    
    x <- x[,featIndices]
    colnames(x) <- featNames
    
    x$subject <- subject[,1]
    x$activity <- y[,1]
    
    mutate(tbl_df(x), activity = activities[activity,2])
}

run_analysis <- function ()
{
    check_package("dplyr")
    
    if (!file.exists("UCI HAR Dataset"))
        download_data()
    
    setwd("UCI HAR Dataset")
    
    message("Loading features")
    features <- read.table("features.txt")
    
    featIndices <- grep("(mean|std)\\(\\)",features$V2)
    featNames <- gsub("-","_",gsub("\\(\\)","",tolower(features$V2[featIndices])))
    
    message("Loading activities")
    activities <- read.table("activity_labels.txt")
    activities$V2 <- as.factor(tolower(activities$V2))
    
    message("Loading training data")
    train <- load_data("train", featIndices, featNames, activities)
    
    message("Loading test data")
    test <- load_data("test", featIndices, featNames, activities)
    
    setwd("..")
    
    message("Creating tidy data set")
    data <- bind_rows(test,train)
    table <- (data %>% group_by(subject,activity) %>% summarise_each(funs(mean)))
    
    colnames(table)[3:length(colnames(table))] <- paste0("average_",colnames(table))[3:length(colnames(table))]
    
    write.table(table,"tidy.txt", row.names=FALSE)
}