
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
with(PowerData, plot(DateTime, Global_reactive_power, type = "l", col="black", ylab = "Global_reactive_power", xlab = ""))

dev.off()