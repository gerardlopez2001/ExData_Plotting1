
png("plot2.png",width = 480, height = 480)
with(PowerData, plot(DateTime, Global_active_power, type = "l", col="black", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()