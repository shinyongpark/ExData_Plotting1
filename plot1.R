plot1<- function(){
  ansData <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
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

  png("plot1.png", width=480, height=480)
  hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off()
}

plot1()
