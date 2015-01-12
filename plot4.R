#plot4

data <- read.csv("./household_power_consumption.txt", sep = ";");

#Subset and sanitize data
test <- strptime(data[1:length(data[,1]), 1], "%d/%m/%Y")
dataFrameTest <- data.frame(test)
data[, 1] = dataFrameTest[,1]
rm(dataFrameTest)
rm(test)

dataFilter <- subset(data, data$Date>="2007-02-01 00:01:00" & data$Date<=" 2007-02-02 23:59:00")
rm(data)

#Prepare plot
# png default parameters are: width = 480, height = 480 so no need to override
test <- strptime(dataFilter[1:length(dataFilter[,2]), 2], "%H:%M:%S")
dataFrameTest <- data.frame(test)
dataFilter[, 2] = dataFrameTest[,1]
rm(dataFrameTest)


##Setup plotting env
png(filename="plot4.png")
par(mfrow=c(2,2))
#1,1
with( dataFilter, plot(Time, Global_active_power, type = "l", main="", ylab = "Global Active Power (kilowatts)"))

#1,2
#voltage dateTime
with( dataFilter, plot(Time, Voltage, type = "l", main="", ylab = "Voltage", xlab="datetime"))

#2,1
with( dataFilter, plot(Time, Sub_metering_1, type = "l", main="", ylab = "Energy Sub-Metering", axes=F))
with( dataFilter, lines(Time, Sub_metering_2, type = "l", main="", ylab = "", col="red"))
with( dataFilter, lines(Time, Sub_metering_3, type = "l", main="", ylab = "", col="blue"))
axis(1)
#Could have used weekday function. No time to finish before assignment due.
axis(2)

#2,2
#names(dataFilter)
with( dataFilter, plot(Time, Global_reactive_power, type = "l", main="", ylab = "Voltage", xlab="datetime"))

dev.off()