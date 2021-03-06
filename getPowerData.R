## getPowerData.R
## Author: Gerard Lopez
## Date: 2014-10-13
## Class: JHBSPH - Exploratory Data Analysis
## Project: 1

## The getPowerData.R script needs to be run first. It will download the data from the website to a local copy. 
## It will then create a data frame with data from only the dates "2/2/2007" and "1/2/2007". It will set the 
## column data types appropriately and add a column for datetime which are the date and time columns joined 
## together. If household_power_consumption.txt is already in the local directory then it will use that copy 
## instead of downloading a fresh one from the website.
## 
## getPowerData.R will output a data frame called PowerData that will be used be each of the subsequent 
## scripts to produce the plots.


#setwd("~/School/JH/04 Exploratory Data Analysis/Projects/ExData_Plotting1/ExData_Plotting1")

# check if file already exists, if not, download. if exists using existing copy
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

#get data out of file and into dataframe
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