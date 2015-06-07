var_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read lines 66638-69517 from text file
myfile <- read.table(file="household_power_consumption.txt", col.names=var_names, sep=";", dec=".", na.string="?" , skip=66637, nrows=2880, stringsAsFactors=FALSE)

# convert character into date
myfile$Date <- strptime(myfile$Date, format="%d/%m/%Y")

png("plot4.png")
par(mfcol=c(2, 2)) # 'mfcol' partitions the plot window into 2 columns and 2 rows

plot(myfile$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)")

plot(myfile$Sub_metering_1, type = "l", ylab="Energy sub metering")
lines(myfile$Sub_metering_2, col="red")
lines(myfile$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c(1, 2, 4), bty = "n")

plot(myfile$Voltage, type = "l", ylab="Voltage", xlab="datetime")

plot(myfile$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
