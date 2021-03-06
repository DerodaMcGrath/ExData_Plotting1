powerdata <- read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows=2880)
colnames(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
newdate <- strptime(paste(powerdata$Date,powerdata$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
plot(newdate, powerdata$Sub_metering_1, type="l" , xlab = "" ,
     ylab = "Energy Sub Metering")
lines(newdate,powerdata$Sub_metering_2, col="red")
lines(newdate,powerdata$Sub_metering_3, col="blue")
legend("topright", cex = 0.6, lty = 1 , col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()