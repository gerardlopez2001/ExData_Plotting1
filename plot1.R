## plot1.R
## Author: Gerard Lopez
## Date: 2014-10-13
## Class: JHBSPH - Exploratory Data Analysis
## Project: 1

### Create plot1.png from UC Irvine Machine Learning Repository Electric power consumption data (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)


### histogram will show global active power in Kilowatts Vs. frequency
png("plot1.png",width = 480, height = 480)
hist(PowerData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()