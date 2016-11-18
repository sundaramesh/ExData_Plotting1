###########################################################
# Exploratory Data Analysis - Project 1                 
###########################################################
# Author  : Ramesh SUndaram
# Code    : plot3.R
# Date    : 11/18/2016
# github  : https://github.com/sundaramesh/ExData_Plotting1
###########################################################


# Setting Read file variable
PowerDataFile <- "household_power_consumption.txt"

PowerData <- read.table(PowerDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filtering and Reading Data for Date Range 2007-02-01 and 2007-02-02.
OneMonthData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

# Stripping off the Date and Time from the filtered data
DateAndTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Geeting SubMetering Data into respective Variables
SubMeterData1 <- as.numeric(OneMonthData$Sub_metering_1)
SubMeterData2 <- as.numeric(OneMonthData$Sub_metering_2)
subMeterData3 <- as.numeric(OneMonthData$Sub_metering_3)

# Setting the output device as png
png("plot3.png", width=480, height=480)

# Plotting the Graph
plot(DateAndTime, SubMeterData1, type="l", ylab="Energy Submetering", xlab="")

# Adding and Setting COlor Coded Lines
lines(DateAndTime, SubMeterData2, type="l", col="red")
lines(DateAndTime, subMeterData3, type="l", col="blue")

legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close the output device
dev.off()






