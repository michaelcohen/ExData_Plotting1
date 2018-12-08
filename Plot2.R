# Exploratory Data Analysis
# Peer-Graded Assignment 1, Plot 2
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

# Welcome, designate file, create Plot 2, save, and say goodbye
png("plot2.png", width=480, height=480)
attach(data)
plot(Global_active_power ~ datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
detach(data)