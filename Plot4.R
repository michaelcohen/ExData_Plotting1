# Exploratory Data Analysis
# Peer-Graded Assignment 1, Plot 4
# Michael Cohen

# Load and read data, hide empties
rm(list=ls())
data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings="?")

# Convert date for subsetting
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data for plots
data <- subset(data, subset=(Date >="2007-02-01" & Date <="2007-02-02"))

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

# Welcome, create four plots, save differently this time, and say goodbye
attach(data)
par(mfrow=c(2, 2))
plot(Global_active_power ~ datetime, type="l", ylab = "Global Active Power", xlab="")
plot(Voltage ~ datetime, type="l")
plot(Sub_metering_1 ~ datetime, type="l", ylab="Energy sub metering", xlab="")
lines(Sub_metering_2 ~ datetime, col="Red")
lines(Sub_metering_3 ~ datetime, col="Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")
plot(Global_reactive_power ~ datetime, type = "l")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
detach(data)