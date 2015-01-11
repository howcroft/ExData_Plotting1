#plot 1
data <- read.csv("./household_power_consumption.txt", sep = ";");

#Subset and sanitize data
test <- strptime(data[1:length(data[,1]), 1], "%d/%m/%Y")
dataFrameTest <- data.frame(test)
data[, 1] = dataFrameTest[,1]
rm(dataFrameTest)
rm(test)

dataFilter <- subset(data, data$Date>=" 2007-02-01 00:00:00" & data$Date<=" 2007-02-02 23:59:00")
rm(data)

#Prepare plot
histX <- as.numeric(dataFilter$Global_active_power)/1000
# png default parameters are: width = 480, height = 480 so no need to override
png(filename="plot1.png")
hist(histX, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", axes=F)
axis(2)
#axis(1, at=as.vector(c(0,2,4,6))) doesn't wo
axis(1, xlim=c(0,6), at=as.vector(c(0,2,4,6)))
dev.off()
