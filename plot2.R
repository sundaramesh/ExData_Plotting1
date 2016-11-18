###########################################################
# Exploratory Data Analysis - Project 1                 
###########################################################
# Author  : Ramesh SUndaram
# Code    : plot2.R
# Date    : 11/17/2016
# github  : https://github.com/sundaramesh/ExData_Plotting1
###########################################################



# Setting Read file variable
PowerDataFile <- "household_power_consumption.txt"

# Reading the file as table into a variable
PowerData <- read.table(PowerDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filtering and Reading Data for Date Range 2007-02-01 and 2007-02-02.
OneMonthData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

# Stripping off the Date and Time from the filtered data
DateAndTime <- strptime(paste(OneMonthData$Date, OneMonthData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Getting Active Power Data
GlobalActivePower <- as.numeric(OneMonthData$Global_active_power)

# Setting the output device as png
png("plot2.png", width=480, height=480)

# Plotting the Graph
plot(DateAndTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the output device
dev.off()
