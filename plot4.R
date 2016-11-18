###########################################################
# Exploratory Data Analysis - Project 1                 
###########################################################
# Author  : Ramesh SUndaram
# Code    : plot4.R
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

# Getting Active Power Data
GlobalActivePower <- as.numeric(OneMonthData$Global_active_power)

# Getting ReActive Power Data
GlobalReactivePower <- as.numeric(OneMonthData$Global_reactive_power)

# Setting Voltage Data to variable
VoltageData <- as.numeric(subSetData$Voltage)

# Geeting SubMetering Data into respective Variables
SubMeterData1 <- as.numeric(OneMonthData$Sub_metering_1)
SubMeterData2 <- as.numeric(OneMonthData$Sub_metering_2)
subMeterData3 <- as.numeric(OneMonthData$Sub_metering_3)

# Setting the output device as png
png("plot4.png", width=480, height=480)

# Setting the Matrix for Graph Data
par(mfrow = c(2, 2)) 

# Plotting Graph for Global Active Power
plot(DateAndTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plotting Graph for Voltage
plot(DateAndTime, VoltageData, type="l", xlab="datetime", ylab="Voltage")

# Plotting the Graph for Energy Submetering
plot(DateAndTime, SubMeterData1, type="l", ylab="Energy Submetering", xlab="")

# Adding and Setting COlor Coded Lines
lines(DateAndTime, SubMeterData2, type="l", col="red")
lines(DateAndTime, subMeterData3, type="l", col="blue")

legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Plotting the Graph for Global Reactive Power
plot(DateAndTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close and the output device
dev.off()





