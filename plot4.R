##plot4
x<- read.table("household_power_consumption.txt",sep=";", header = TRUE)
x$newdate <- with(x, strptime(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S"))
x$Date <-as.Date(x$Date, format="%d/%m/%Y")
y <- x[(x$Date %in% as.Date(c("2007-02-01","2007-02-02"))), ]
y$Sub_metering_1<-as.numeric( as.character(y$Sub_metering_1))
y$Sub_metering_2<-as.numeric( as.character(y$Sub_metering_2))
y$Sub_metering_3<-as.numeric( as.character(y$Sub_metering_3))
y$Voltage<-as.numeric( as.character(y$Voltage))
y$Global_reactive_power<-as.numeric( as.character(y$Global_reactive_power))
par(mfcol = c(2, 2),cex=.75, cex.axis=1)
with(y, {
plot(y$newdate,y$Global_active_power, type = "l",ylab="Global Active Power", xlab = "")
plot(y$newdate,y$Sub_metering_1,type="l",col="black",ylab="Energy sub metering", xlab="")
lines(y$newdate,y$Sub_metering_2,col="red")
lines(y$newdate,y$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),bty="n",cex=0.5, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(y$newdate,y$Voltage, xlab="datetime", ylab="Voltage", type = "l")
plot(y$newdate,y$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l")
})
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() 