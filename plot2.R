# plot 2

data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors =FALSE)
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date <- as.Date(data_subset$Date, "%d/%m/%Y")
dateTime <- strptime(paste(date, data_subset$Time), "%Y-%m-%d %H:%M:%S")

data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

plot(dateTime, data_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png")
dev.off()