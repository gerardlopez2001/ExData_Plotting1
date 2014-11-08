## plot4.R
## Author: Gerard Lopez
## Date: 2014-10-13
## Class: JHBSPH - Exploratory Data Analysis
## Project: 1

### Create plot4.png from UC Irvine Machine Learning Repository Electric power consumption data (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

### Plot4.png will have 4 separate plots in one .png in a 2x2 configuration.

### top left: graph will show global active power in Kilowatts Vs. time for 2 days

### top right: graph will show voltage Vs. time for 2 days

### bottom left: graph will show three lines for energy sub metering (1,2 & 3) Vs. time for 2 days

### bottom right: graph will show global reactive power in Kilowatts Vs. time for 2 days

source('getPowerData.R')

png("plot4.png",width = 480, height = 480)

#set 2 x 2 plots
par(mfrow = c(2,2))

#top left
with(PowerData, plot(DateTime, Global_active_power, type = "l", col="black", ylab = "Global Active Power", xlab = ""))

#top right
with(PowerData, plot(DateTime, Voltage, type = "l", col="black", ylab = "Voltage", xlab = "datetime"))

#bottom left
with(PowerData, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(PowerData, points(DateTime, Sub_metering_1, type = "l",  col="black"))
with(PowerData, points(DateTime, Sub_metering_2, type = "l", col="red"))
with(PowerData, points(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lwd = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#bottom right
with(PowerData, plot(DateTime, Global_reactive_power, type = "l", col="black", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()