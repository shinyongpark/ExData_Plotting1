plot2 <- function(){
  
  ansData <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
  FullTimeDate <- strptime(paste(ansData$Date, ansData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  ansData <- cbind(ansData, FullTimeDate)
  
  ansData$Date <- as.Date(ansData$Date, format="%d/%m/%Y")
  ansData$Time <- format(ansData$Time, format="%H:%M:%S")
  ansData$Global_active_power <- as.numeric(ansData$Global_active_power)
  ansData$Global_reactive_power <- as.numeric(ansData$Global_reactive_power)
  ansData$Voltage <- as.numeric(ansData$Voltage)
  ansData$Global_intensity <- as.numeric(ansData$Global_intensity)
  ansData$Sub_metering_1 <- as.numeric(ansData$Sub_metering_1)
  ansData$Sub_metering_2 <- as.numeric(ansData$Sub_metering_2)
  ansData$Sub_metering_3 <- as.numeric(ansData$Sub_metering_3)
  
  subsetdata <- subset(ansData, Date == "2007-02-01" | Date =="2007-02-02")
  
  png("plot2.png", width=480, height=480)
  with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
  dev.off()
}

plot2()