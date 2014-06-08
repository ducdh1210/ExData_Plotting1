# plot 3

data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors =FALSE)

data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data_subset$Sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
data_subset$Sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
data_subset$Sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)

date <- as.character(as.Date(data_subset$Date, "%d/%m/%Y"))
dateTime <- strptime(paste(date, data_subset$Time), "%Y-%m-%d %H:%M:%S")

plot(dateTime, data_subset$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, data_subset$Sub_metering_2, type="l", col="red")
lines(dateTime, data_subset$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=2, lwd =2)

dev.copy(png, file="plot3.png")
dev.off()