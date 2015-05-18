powerData <- read.table("./household_power_consumption.txt",
                        header=TRUE, sep=";", na.strings = "?")
powerData$DateTime <- paste(powerData$Date, powerData$Time)
powerData$DateTime <- strptime(powerData$DateTime, "%d/%m/%Y %H:%M:%S")
dataSet <- subset(powerData, DateTime >= as.POSIXct("2007-02-01 00:00:00")
                  & DateTime < as.POSIXct("2007-02-03 00:00:00"))
png(filename = "plot1.png")
hist(dataSet$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
