#plot3
data <- read.csv("./household_power_consumption.txt", sep = ";");

#Subset and sanitize data
test <- strptime(data[1:length(data[,1]), 1], "%d/%m/%Y")
dataFrameTest <- data.frame(test)
data[, 1] = dataFrameTest[,1]
rm(dataFrameTest)
rm(test)

dataFilter <- subset(data, data$Date>="2007-02-01 00:00:00" & data$Date<=" 2007-02-02 23:59:00")
rm(data)

#Prepare plot
# png default parameters are: width = 480, height = 480 so no need to override
test <- strptime(dataFilter[1:length(dataFilter[,2]), 2], "%H:%M:%S")
dataFrameTest <- data.frame(test)
dataFilter[, 2] = dataFrameTest[,1]
rm(dataFrameTest)
#weekdays(strptime("2007-02-02 01:01:00", "%Y-%m-%d %H:%M:%S"))
#temp <- dataFilter[c(1,702,1439),2]
#temp <- lapply(temp, function(x)weekdays(x, abbreviate=T))

png(filename="plot3.png")
#hist(histX, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", )
with( dataFilter, plot(Time, Sub_metering_1, type = "l", main="", ylab = "Energy Sub-Metering", axes=F))
with( dataFilter, lines(Time, Sub_metering_2, type = "l", main="", ylab = "", col="red"))
with( dataFilter, lines(Time, Sub_metering_3, type = "l", main="", ylab = "", col="blue"))

axis(1)
#Could have used weekday function. No time to finish before assignment due.
axis(2)
#axis(2, at=dataFilter[c(1, length(dataFilter[,1]/2, length(dataFilter[,1])), ], labels = c("Thu", "Fri", "Sat"))
dev.off()