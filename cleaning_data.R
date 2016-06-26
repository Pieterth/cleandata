# Assignment cleaning data
# 12 June 2016, Pieter ten Have


setwd("C:/Users/Pieter/r-coursera3")
rm(list=ls())

# List of features is used to name the variables and select those which contain strings "mean" or "std()"

ftr<-read.table("features.txt", sep='', header=F)
dim(ftr)
keep1<-grep("mean", ftr[,2], fixed = T)
keep2<-grep("std()", ftr[,2],  fixed = T)
keep3<-c(keep1, keep2)
ftr2<-ftr[keep3,]
colnames(ftr2)<-c("number", "feature")
ftr2<-ftr2[order(ftr2$feature),]
ftr2$number<-c(1:79)
write.csv(ftr2, file="feature_list.csv")


# Train-set is formed by pasting "selected features" (x), "subject number" and "target" (y)

trn_x<-read.table("X_train.txt", sep='', header=F)
colnames(trn_x)<-ftr  [,2]
trn_x<-trn_x[,keep3]
trn_y<-read.table("y_train.txt", sep='', header=F)
colnames(trn_y)<-"target"
trn_subj<-read.table("subject_train.txt", sep="", header=F)
colnames(trn_subj)<-"subject"
train<-cbind(trn_subj, trn_x, trn_y)


# Test-set is formed by pasting "selected features" (x), "subject number" and "target" (y)

tst_x<-read.table("X_test.txt", sep='', header=F)
colnames(tst_x)<-ftr[,2]
tst_x<-tst_x[,keep3]
tst_y<-read.table("y_test.txt", sep='', header=F)
colnames(tst_y)<-"target"
tst_subj<-read.table("subject_test.txt", sep="", header=F)
colnames(tst_subj)<-"subject"
test<-cbind(tst_subj, tst_x, tst_y)
colnames(test)


# Train and test-dataset are merged by row bind.

total<-rbind(test, train)
write.csv(total, file="total.csv")


#Averages of each variable are calculted by subject

avg_person<-aggregate(. ~ subject, data=total, function(x) mean(x))
avg_person<-avg_person[,-81]
write.csv(avg_person, file="avg_person.csv")
