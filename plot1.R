#plot 1
data <- read.csv("./household_power_consumption.txt", sep = ";", na.string="?");


#Subset
data <- subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")


#Sanitize data
test <- strptime(data[1:length(data[,1]), 1], "%d/%m/%Y %H:%M:%S")
dataFrameTest <- data.frame(test)
data[, 1] <- dataFrameTest[,1]
rm(dataFrameTest)
rm(test)
rm(dataFilter)


#Prepare plot
histX <- as.numeric(data$Global_active_power)
# png default parameters are: width = 480, height = 480 so no need to override
png(filename="plot1.png")
hist(histX, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
