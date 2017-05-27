##plot2
x<- read.table("household_power_consumption.txt",sep=";", header = TRUE)
x$newdate <- with(x, strptime(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S"))
x$Date <-as.Date(x$Date, format="%d/%m/%Y")
y <- x[(x$Date %in% as.Date(c("2007-02-01","2007-02-02"))), ]
y$Global_active_power<-as.numeric( as.character(y$Global_active_power))
plot(y$newdate,y$Global_active_power, type = "l",ylab="Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()