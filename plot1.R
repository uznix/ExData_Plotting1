var_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read lines 66638-69517 from text file
myfile <- read.table(file="household_power_consumption.txt", col.names=var_names, sep=";", dec=".", na.string="?" , skip=66637, nrows=2880, stringsAsFactors=FALSE)

# convert character into date
myfile$Date <- strptime(myfile$Date, format="%d/%m/%Y")

png("plot1.png")
hist(myfile$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
