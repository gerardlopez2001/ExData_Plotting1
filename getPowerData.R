# setwd("~/School/JH/04 Exploratory Data PowerData/Projects/ExData_Plotting1/ExData_Plotting1")


if (!file.exists("household_power_consumption.txt")){
        

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# create a temporary directory
td = tempdir()
# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")
# download into the placeholder file
download.file(fileUrl, tf)
# get the name of the first file in the zip archive
fname = unzip(tf, list=TRUE)$Name[1]
# unzip the file to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
fpath = file.path(td, fname)
#copy to local
file.copy(fpath, "household_power_consumption.txt")
}

#get data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
PowerData <- data[(data$Date == "2/2/2007" | data$Date == "1/2/2007"),]
rm(data)

#set column datatypes
PowerData$DateTime = strptime( (paste(PowerData$Date,PowerData$Time )), "%d/%m/%Y %H:%M:%S") 
PowerData$Date = strptime(PowerData$Date, "%d/%m/%Y")
PowerData$Time = strptime(PowerData$Time, "%H:%M:%S")
PowerData$Global_active_power = as.double(as.character(PowerData$Global_active_power))
PowerData$Global_reactive_power = as.double(as.character(PowerData$Global_reactive_power))
PowerData$Voltage = as.double(as.character(PowerData$Voltage))
PowerData$Global_intensity = as.double(as.character(PowerData$Global_intensity))
PowerData$Sub_metering_1 = as.double(as.character(PowerData$Sub_metering_1))
PowerData$Sub_metering_2 = as.double(as.character(PowerData$Sub_metering_2))
PowerData$Sub_metering_3 = as.double(as.character(PowerData$Sub_metering_3))
# PowerData$DateTime = strptime(PowerData$Date, "%d/%m/%Y") & strptime(PowerData$Time, "%H:%M:%S")
# 
# PowerData$Weekday = weekdays(PowerData$Date)
