powerData <- read.table("./household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na.strings = "?")
powerData$DateTime <- paste(powerData$Date, powerData$Time)
powerData$DateTime <- strptime(powerData$DateTime, "%d/%m/%Y %H:%M:%S")

dataSet <- subset(powerData,
                  DateTime >= as.POSIXct("2007-02-01 00:00:00")
                  & DateTime < as.POSIXct("2007-02-03 00:00:00"))
png("plot3.png")

plot(dataSet$DateTime,
     dataSet$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(dataSet$DateTime,
      dataSet$Sub_metering_2,
      type = "l",
      col = "red")

lines(dataSet$DateTime,
      dataSet$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()
