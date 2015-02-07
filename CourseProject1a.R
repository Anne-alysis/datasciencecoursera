f<-"household_power_consumption.txt"
tab5rows<-read.table(f,header=TRUE, nrows=5,sep=";")
#classes<-sapply(tab5rows,class)
#x<-read.table(f,header=TRUE,colClasses=classes,sep=";",skip=66637,nrows=2882)
x<-read.table(f,sep=";",skip=66637,nrows=2880)
names(x)<-names(tab5rows)
x[x=="?"]<-NA