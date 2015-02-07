f<-"household_power_consumption.txt"
tab5rows<-read.table(f,header=TRUE, nrows=5,sep=";")
x<-read.table(f,sep=";",skip=66637,nrows=2880)
names(x)<-names(tab5rows)
x[x=="?"]<-NA
x$newtime<-as.POSIXct(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S")



with(x,plot(newtime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

dev.copy(png,file="plot2.png")
dev.off()
