# This script expects you to download the data file from: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzip the file into a directory named data in the Project folder

data <- read.csv("./data/household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filter <- data$Date == as.Date('2007-02-01') | 
  data$Date == as.Date('2007-02-02')
subset <- data[filter,]
times <- strptime(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")
powers <- as.numeric(subset$Global_active_power)

png("plot4.png")
par(mfrow = c(2,2))

plot(times, powers, type="l",
     ylab="Global Active Power", 
     xlab="")

plot(times, subset$Voltage, type="l",
     ylab="Voltage", 
     xlab="datetime")

plot(times,subset$Sub_metering_1, type="n",
     ylab="Energy sub metering", 
     xlab="")
lines(times,subset$Sub_metering_1)
lines(times,subset$Sub_metering_2, col="red")
lines(times,subset$Sub_metering_3, col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty="n",
       pch="-", 
       col=c("black", "red", "blue"))

plot(times, subset$Global_reactive_power, type="l",
     ylab="Global_reactive_power", 
     xlab="datetime")

dev.off()