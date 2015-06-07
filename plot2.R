plot2 <- function(){
  
  hp <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
  
  hp <- hp[hp["Date"] == "1/2/2007" | hp["Date"] == "2/2/2007", ]
  
  hp$date.time <- strptime(paste(hp$Date, hp$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
  
  plot(hp$date.time,hp$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  
  dev.off()
  
}