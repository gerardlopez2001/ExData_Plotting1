## plot3.R
## Author: Gerard Lopez
## Date: 2014-10-13
## Class: JHBSPH - Exploratory Data Analysis
## Project: 1

### Create plot3.png from UC Irvine Machine Learning Repository Electric power consumption data (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

source('getPowerData.R')

### graph will show three lines for energy sub metering (1,2 & 3) Vs. day of the week
png("plot3.png",width = 480, height = 480)

with(PowerData, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(PowerData, points(DateTime, Sub_metering_1, type = "l",  col="black"))
with(PowerData, points(DateTime, Sub_metering_2, type = "l", col="red"))
with(PowerData, points(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lwd = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()