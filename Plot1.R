f<-"household_power_consumption.txt"
tab5rows<-read.table(f,header=TRUE, nrows=5,sep=";")
x<-read.table(f,sep=";",skip=66637,nrows=2880)
names(x)<-names(tab5rows)
x[x=="?"]<-NA
x$newtime<-as.POSIXct(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S")



hist(x[,"Global_active_power"],col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()
