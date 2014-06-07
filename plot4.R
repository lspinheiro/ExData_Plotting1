household <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE)
household$DateTime <- strptime(paste(household$Date, household$Time),format="%d/%m/%Y %H:%M:%S")
house_subset <- subset(household, DateTime >= strptime("2007-02-01 00:00:00",format="%Y-%m-%d %H:%M:%S") & DateTime <= strptime("2007-02-02 23:59:59",format="%Y-%m-%d %H:%M:%S"))
row.names(house_subset) = NULL
house_subset$Global_active_power <- as.numeric(house_subset$Global_active_power)
house_subset$Sub_metering_1 <- as.numeric(house_subset$Sub_metering_1)
house_subset$Sub_metering_2 <- as.numeric(house_subset$Sub_metering_2)
house_subset$Sub_metering_3 <- as.numeric(house_subset$Sub_metering_3)
house_subset$Global_reactive_power <- as.numeric(house_subset$Global_reactive_power)
house_subset$Voltage <- as.numeric(house_subset$Voltage)


#plot 4
## DATE TIME IN PORTUGUESE BECAUSE I DONT WANNA MESS WITH SYS DATES
par(mfrow = c(2, 2), mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(house_subset, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(house_subset$DateTime, house_subset$Sub_metering_1, type = "l", ylab = "Energy sub meeting", xlab = "",  col = "black")
  points(house_subset$DateTime, house_subset$Sub_metering_2, col = "red", type = "l")
  points(house_subset$DateTime, house_subset$Sub_metering_3, col = "blue", type = "l")
  legend("topright", pch = "_", bty = "n",col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(DateTime, Global_reactive_power, type = "l", yaxs = "i", ylab = "Global Reactive Power", xlab = "datetime")
})
dev.copy(png, file = "plot4.png", width = 752, height = 534)
dev.off()