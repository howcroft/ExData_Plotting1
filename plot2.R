#plot2
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
#weekdays(strptime("2007-02-02 01:01:00", "%Y-%m-%d %H:%M:%S"))
#temp <- dataFilter[c(1,702,1439),2]
#temp <- lapply(temp, function(x)weekdays(x, abbreviate=T))

png(filename="plot2.png")
#hist(histX, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", )
with( dataFilter, plot(Time, Global_active_power, type = "l", main="", ylab = "Global Active Power (kilowatts)", axes=F))
axis(2)
axis(1)
dev.off()

