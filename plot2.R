


setwd("G:/Coursera/exploratoryDataAnalysis/Assignment1/ExData_Plotting1")

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")

options(stringsAsFactors = F)
hhPower <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

hhPower$Date <- as.Date(hhPower$Date, format = "%d/%m/%Y")

hhPower <- subset(hhPower, as.Date("2007-02-01") <= Date & Date <= as.Date("2007-02-02"))
hhPower$Time <- format(strptime(hhPower$Time, "%H:%M:%S"), "%H:%M:%S")

hhPower$DateTime <- as.POSIXlt(paste(hhPower$Date, hhPower$Time))

str(hhPower)

png("plot2.png")
par(bg = NA)
with(hhPower, plot(hhPower$DateTime, Global_active_power, type = "l",
                    xlab = "", ylab = "Global active power (kilowatts)"))
dev.off()
