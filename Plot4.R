f<-"household_power_consumption.txt"
tab5rows<-read.table(f,header=TRUE, nrows=5,sep=";")
x<-read.table(f,sep=";",skip=66637,nrows=2880)
names(x)<-names(tab5rows)
x[x=="?"]<-NA
x$newtime<-as.POSIXct(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S")


par(mfrow=c(2,2),mar=c(4,3,3,1))
with(x,plot(newtime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
with(x,plot(newtime,Voltage,type="l",ylab="Voltage",xlab="datetime"))
with(x,plot(newtime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(x,lines(newtime,Sub_metering_2,type="l",col="red",xlab=""))
with(x,lines(newtime,Sub_metering_3,type="l",col="blue",xlab=""))
legend("topright",bty="n",cex=.6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
with(x,plot(newtime,Global_reactive_power,type="l",,xlab="datetime"))
dev.copy(png,file="plot4.png")
dev.off()
