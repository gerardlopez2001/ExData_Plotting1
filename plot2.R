## plot2.R
## Author: Gerard Lopez
## Date: 2014-10-13
## Class: JHBSPH - Exploratory Data Analysis
## Project: 1

### Create plot2.png from UC Irvine Machine Learning Repository Electric power consumption data (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

source('getPowerData.R')

### graph will show global active power in Kilowatts Vs. day of the week
png("plot2.png",width = 480, height = 480)
with(PowerData, plot(DateTime, Global_active_power, type = "l", col="black", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()