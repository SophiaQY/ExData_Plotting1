#### reading data
data <- read.table("household_power_consumption.txt", skip = 1,sep = ";")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                 "Sub_metering_3")

#### subset data
datasub <- subset(data, data$Date %in% c("1/2/2007","2/2/2007" ))

#### transform date format and create new vector datetime
datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#### Plot 4
png("plot4.png", width=480, height=480)
par(mfrow= c(2,2))
plot(datetime,as.numeric(datasub$Global_active_power),
     type="l",xlab="",ylab="Global Active Power")

plot(datetime, as.numeric(datasub$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, as.numeric(datasub$Sub_metering_1), type = "l", 
     xlab="", ylab="Energy sub metering")
points(datetime, as.numeric(datasub$Sub_metering_2), type="l", col="red")
points(datetime, as.numeric(datasub$Sub_metering_3), type="l", col="blue")
legend("topright", lty = 1,  col = c("black", "red", "blue"), cex = 0.6,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(datetime, as.numeric(datasub$Global_active_power), type = "l",
     xlab="datetime", ylab="Global_reactive_power")
dev.off()
