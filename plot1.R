library(sqldf)
df <- read.csv.sql("household_power_consumption.csv", 
                   "select *, strftime('%d/%m/%Y', Date)
                   as Date from file where Date >= 1/2/2007 or Date <= 2/2/2007 ", sep=";")

kim <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

enrico <- as.numeric(kim$Global_active_power)

png("plot1.png", height =480, width = 480)
hist(enrico,main="Global Active Power",xlab="Global Active Power (killowatts)", ylab="Frequency", col = "red")
dev.off()
