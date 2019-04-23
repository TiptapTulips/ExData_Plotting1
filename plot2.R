library(sqldf)
library(dplyr)

df <- read.csv.sql("household_power_consumption.csv", 
                   "select *, strftime('%d/%m/%Y', Date)
                   as Date from file where Date >= 1/2/2007 or Date <= 2/2/2007 ", sep=";")

kim <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
mikmik <- subset(kim, Date!="?")
mikmik$Date <- strptime(paste(mikmik$Date, mikmik$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", height =480, width = 480)
plot(mikmik$Date,mikmik$Global_active_power, typ="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
