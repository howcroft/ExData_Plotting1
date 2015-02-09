#plot3
data <- read.csv("./household_power_consumption.txt", sep = ";", na.string="?");


#Subset
data <- subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")


#Sanitize data
#Sanitize data
data$Time <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")


#Prepare plot
# png default parameters are: width = 480, height = 480 so no need to override
png(filename="plot3.png")
with( data, plot(Time, Sub_metering_1, type = "l", main="", ylab = "Energy Sub-Metering"))
with( data, lines(Time, Sub_metering_2, type = "l", main="", ylab = "", col="red"))
with( data, lines(Time, Sub_metering_3, type = "l", main="", ylab = "", col="blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()