library(dplyr)
activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")

x_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/Y_test.txt")
subject_test<-read.table("./test/subject_test.txt")
x_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/Y_train.txt")
subject_train<-read.table("./train/subject_train.txt")

names(x_test)<-features[,2]
names(x_train)<-features[,2]

ind<-grep("mean|std",features[,2])
tokeep<-features[ind,1]
x_test_trunc<-x_test[,tokeep]
x_train_trunc<-x_train[,tokeep]
x_test_id<-apply(y_test,1,function(z) activity_labels[z,2])
x_train_id<-apply(y_train,1,function(z) activity_labels[z,2])

x_test_trunc<-mutate(x_test_trunc,subject_id=subject_test[,1],test_id=x_test_id)
x_train_trunc<-mutate(x_train_trunc,subject_id=subject_train[,1],test_id=x_train_id)

n<-dim(x_test_trunc)[2]-2
ord<-c(n+1,n+2,1:n)
x_test_final<-x_test_trunc[,ord]
x_train_final<-x_train_trunc[,ord]
x<-rbind(x_test_final,x_train_final)
names(x)<-gsub("[()-]","",names(x))

ind<-grep("mean",names(x))
x_sum<-x[,c(1,2,ind)]
x_group<-group_by(x_sum,subject_id,test_id)
t<-data.frame(summarise_each(x_group,funs(mean)))
# to check the summarize_each function: 
#t1<-data.frame(summarize(x_group,mean1=mean(tBodyAccmeanX),mean2=mean(tBodyAccmeanY)))

names(t)<-gsub("mean","",names(t))
write.table(t,"CleanData_Project2.txt",row.name=FALSE)
