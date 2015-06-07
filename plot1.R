plot1 <- function(){
  
  hp <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
  
  hp <- hp[hp["Date"] == "1/2/2007" | hp["Date"] == "2/2/2007", ]

  png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
  
  hist(hp$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  
  dev.off()
    
}