#### reading data
data <- read.table("household_power_consumption.txt", skip = 1,sep = ";")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                 "Sub_metering_3")

#### subset data
datasub <- subset(data, data$Date %in% c("1/2/2007","2/2/2007" ))

#### transform date format and create new vector datetime
datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

####Plot 2
png("plot2.png", width=480, height=480)
plot(datetime,as.numeric(datasub$Global_active_power),
     type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
