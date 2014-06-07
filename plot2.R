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


# plot 2
### DATE TIME IN PORTUGUESE BECAUSE I DONT WANNA MESS WITH SYS DATES
plot(house_subset$DateTime, house_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()