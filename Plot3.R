f<-"household_power_consumption.txt"
tab5rows<-read.table(f,header=TRUE, nrows=5,sep=";")
x<-read.table(f,sep=";",skip=66637,nrows=2880)
names(x)<-names(tab5rows)
x[x=="?"]<-NA
x$newtime<-as.POSIXct(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S")

with(x,plot(newtime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(x,lines(newtime,Sub_metering_2,type="l",col="red",xlab=""))
with(x,lines(newtime,Sub_metering_3,type="l",col="blue",xlab=""))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)



dev.copy(png,file="plot3.png")
dev.off()
