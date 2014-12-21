library(reshape2)
# read in files
X_test <- read.table("UCI_Dataset/test/X_test.txt")
y_test <- read.table("UCI_Dataset/test/y_test.txt")
subject_test <- read.table("UCI_Dataset/test/subject_test.txt")
X_train <- read.table("UCI_Dataset/train/X_train.txt")
y_train <- read.table("UCI_Dataset/train/y_train.txt")
subject_train <- read.table("UCI_Dataset/train/subject_train.txt")
activity_labels <- read.table("UCI_Dataset/activity_labels.txt")
features <- read.table("UCI_Dataset/features.txt")

# bind information
A <- data.frame(Activity=y_test, Subject=subject_test)
names(A)[1] <- "Activity";names(A)[2] <- "Subject"
B <- data.frame(Activity=y_train, Subject=subject_train)
names(B)[1] <- "Activity";names(B)[2] <- "Subject"
C <- merge(A,B,all=TRUE)
D <- merge(X_train,X_test,all=TRUE)
names(D) <- features$V2
E <- D[,grep("(.*(mean()).*)|(.*(std()).*)", j),]
F <- data.frame(C,E)

# take mean of observations per activity per subject.
G <- melt(F,id=c("Activity","Subject"),measure.vars=names(F))
H <- dcast(G,Activity+Subject ~ variable,sum)

# replace activity numbers with Activity names
for(i in activity_labels$V1)
{	
	H$Activity <- gsub(i,activity_labels$V2[i],H$Activity)
}
write.table(H,file="output.txt",row.name=FALSE)