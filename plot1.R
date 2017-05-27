##plot1
x<- read.table("household_power_consumption.txt",sep=";", header = TRUE)
x$newdate <- with(x, strptime(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S"))
x$Date <-as.Date(x$Date, format="%d/%m/%Y")
y <- x[(x$Date %in% as.Date(c("2007-02-01","2007-02-02"))), ]
y$Global_active_power<-as.numeric( as.character(y$Global_active_power))
hist(y$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()