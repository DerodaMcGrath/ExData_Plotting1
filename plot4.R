powerdata <- read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows=2880)
colnames(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
newdate <- strptime(paste(powerdata$Date,powerdata$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2), cex.axis = 0.75, cex.lab = 0.75)
with(powerdata, {
  plot(newdate,powerdata$Global_active_power,type="l",xlab = "",ylab = "Global Active Power")
  plot(newdate,powerdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(newdate,powerdata$Sub_metering_1,type="l",xlab = "" ,
       ylab="Energy Sub Metering")
  lines(newdate,powerdata$Sub_metering_2, col="red")
  lines(newdate,powerdata$Sub_metering_3, col="blue")
  legend("topright",cex = 0.4, bty="n", lty = 1 , col = c("black", "red", "blue"),
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(newdate,powerdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png,file="plot4.png")
dev.off()