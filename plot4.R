# plot 4

columnClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses= columnClasses,skip=0,na.strings="?")

data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date <- as.character(as.Date(data_subset$Date, "%d/%m/%Y"))
dateTime <- strptime(paste(date, data_subset$Time), "%Y-%m-%d %H:%M:%S")

png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2)) 

plot(dateTime,data_subset$Global_active_power, type="l", xlab="",ylab="Global Active Power")
plot(dateTime,data_subset$Voltage, type="l", xlab="datetime",ylab="Voltage")
plot(dateTime,data_subset$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(dateTime,data_subset$Sub_metering_2,col="red")
lines(dateTime,data_subset$Sub_metering_3,col="blue")
legend("topright", lty=2, lwd =2, bty = "n", col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
plot(dateTime,data_subset$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()