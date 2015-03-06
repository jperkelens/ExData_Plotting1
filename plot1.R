# This script expects you to download the data file from: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzip the file into a directory named data in the Project folder

data <- read.csv("./data/household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filter <- data$Date == as.Date('2007-02-01') | 
  data$Date == as.Date('2007-02-02')
subset <- data[filter,]
powers <- as.numeric(subset$Global_active_power)
png("plot1.png")
hist(powers,
     col=c("red"), 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
     breaks=seq(0,7.5,by=.5))
dev.off()