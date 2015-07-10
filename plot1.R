powerdata <- read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows=2880)
colnames(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hist(powerdata$Global_active_power,col="red",breaks=12,
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()

