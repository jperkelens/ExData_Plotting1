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
png("plot2.png")
plot(times, powers, type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")
dev.off()