# plot 1


data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors =FALSE)
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

hist(data_subset$Global_active_power, col="red",  main = "Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()

