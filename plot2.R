powerData <- read.table("./household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na.strings = "?")
powerData$DateTime <- paste(powerData$Date, powerData$Time)
powerData$DateTime <- strptime(powerData$DateTime, "%d/%m/%Y %H:%M:%S")
dataSet <- subset(powerData, DateTime >= as.POSIXct("2007-02-01 00:00:00")
                  & DateTime < as.POSIXct("2007-02-03 00:00:00"))
png(filename = "plot2.png")

plot(dataSet$DateTime,
     dataSet$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
