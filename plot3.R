
png("plot3.png",width = 480, height = 480)

with(PowerData, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(PowerData, points(DateTime, Sub_metering_1, type = "l",  col="black"))
with(PowerData, points(DateTime, Sub_metering_2, type = "l", col="red"))
with(PowerData, points(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lwd = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()