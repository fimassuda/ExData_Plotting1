plot4 <- function(){
  
  hp <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
  
  hp <- hp[hp["Date"] == "1/2/2007" | hp["Date"] == "2/2/2007", ]
  
  hp$date.time <- strptime(paste(hp$Date, hp$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
    
  png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
  
  par(mfrow = c(2, 2))
  
  with(hp, {
    plot(hp$date.time,hp$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
    plot(hp$date.time, hp$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    with(hp, plot(hp$date.time,hp$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black"))
    with(hp, lines(hp$date.time,hp$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red"))
    with(hp, lines(hp$date.time,hp$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue"))
    legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
    plot(hp$date.time, hp$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
    
  })

  dev.off()
  
}