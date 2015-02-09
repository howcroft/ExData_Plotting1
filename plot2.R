#plot2
data <- read.csv("./household_power_consumption.txt", sep = ";", na.string="?");



#Subset
data <- subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")


#Sanitize data
data$Time <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")


#Prepare plot
# png default parameters are: width = 480, height = 480 so no need to override
#weekdays(strptime("2007-02-02 01:01:00", "%Y-%m-%d %H:%M:%S"))
png(filename="plot2.png")
plot(data$Time, data$Global_active_power, type = "l", main="", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
