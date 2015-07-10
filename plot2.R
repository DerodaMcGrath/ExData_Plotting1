powerdata <- read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows=2880)
colnames(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
newdate <- strptime(paste(powerdata$Date,powerdata$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
plot(newdate, powerdata$Global_active_power, type="l" , xlab = "" ,
     ylab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()