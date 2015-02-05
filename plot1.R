


setwd("G:/Coursera/exploratoryDataAnalysis/Assignment1/ExData_Plotting1")

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")

options(stringsAsFactors = F)
hhPower <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

hhPower$Date <- as.Date(hhPower$Date, format = "%d/%m/%Y")

hhPower <- subset(hhPower, as.Date("2007-02-01") <= Date & Date <= as.Date("2007-02-02"))
hhPower$Time <- format(strptime(hhPower$Time, "%H:%M:%S"), "%H:%M:%S")

str(hhPower)



png("plot1.png")
par(bg = NA)
with(hhPower, hist(Global_active_power, col = "red", 
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)",
                   ylim = c(0, 1200)))
dev.off()
