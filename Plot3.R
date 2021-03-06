# Exploratory Data Analysis
# Peer-Graded Assignment 1, Plot 3
# Michael Cohen

# Load and read data, hide empties
rm(list=ls())
data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings="?")

# Convert date for subsetting
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data for Plot 2
data <- subset(data, subset=(Date >="2007-02-01" & Date <="2007-02-02"))

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

# Welcome, designate file, create Plot 3, save, and say goodbye
attach(data)
png("plot3.png", width=480, height=480)
plot(Sub_metering_1 ~ datetime, type="l", 
     ylab = "Energy sub metering", xlab="")
lines(Sub_metering_2 ~ datetime, col="Red")
lines(Sub_metering_3 ~ datetime, col="Blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
detach(data)