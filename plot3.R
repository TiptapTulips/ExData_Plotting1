library(sqldf)
library(dplyr)

df <- read.csv.sql("household_power_consumption.csv", 
                   "select *, strftime('%d/%m/%Y', Date)
                   as Date from file where Date >= 1/2/2007 or Date <= 2/2/2007 ", sep=";")

kim <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
mikmik <- subset(kim, Date!="?")
mikmik$Date <- strptime(paste(mikmik$Date, mikmik$Time), "%d/%m/%Y %H:%M:%S")


png("plot3.png", height =480, width = 480)
plot(mikmik$Date,mikmik$Sub_metering_1, typ="l",xlab="", ylab="Energy sub metering")
lines(mikmik$Date,mikmik$Sub_metering_2, col = "red")
lines(mikmik$Date,mikmik$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty =1, lwd=2.5,
       col = c("black", "red", "blue"))
dev.off()
