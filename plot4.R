#plot4

data <- read.csv("./household_power_consumption.txt", sep = ";", na.string="?");


#Subset
data <- subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")


#Sanitize data
#Sanitize data
data$Time <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")


#Prepare plot
# png default parameters are: width = 480, height = 480 so no need to override
##Setup plotting env
png(filename="plot4.png")
par(mfrow=c(2,2))
#1,1
with(data, plot(Time, Global_active_power, type = "l", main="", ylab = "Global Active Power (kilowatts)"))

#1,2
#voltage dateTime
with(data, plot(Time, Voltage, type = "l", main="", ylab = "Voltage", xlab="datetime"))

#2,1
with( data, plot(Time, Sub_metering_1, type = "l", main="", ylab = "Energy Sub-Metering"))
with( data, lines(Time, Sub_metering_2, type = "l", main="", ylab = "", col="red"))
with( data, lines(Time, Sub_metering_3, type = "l", main="", ylab = "", col="blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#2,2
with( data, plot(Time, Global_reactive_power, type = "l", main="", ylab = "Voltage", xlab="datetime"))

dev.off()