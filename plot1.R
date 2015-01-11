#plot 1
data <- read.csv("./household_power_consumption.txt", sep = ";");

#Retrieve only first dates
#data[[1]] eq data[,1]
#data[1,1]
#class(data[1,1])
#class(strptime(data[1,1], "%d/%m/%Y"))
#as.Date(strptime(data[1,1], "%d/%m/%Y"))

#Subset and sanitize data
test <- strptime(data[1:length(data[,1]), 1], "%d/%m/%Y")
dataFrameTest <- data.frame(test)
data[, 1] = dataFrameTest[,1]
rm(dataFrameTest)
rm(test)
#data[1, 1]
#class(data[1,1])
#class(dataFrameTest[1,1])
#names(data)
dataFilter <- subset(data, data$Date>=" 2007-02-01" & data$Date<=" 2007-02-02")
rm(data)
#dataFilter[1:3,]
#data <- data[1:3,]

#Prepare plot
#Weekdays(data[,1], abbreviate=T)
#class(dataFilter$Global_active_power)
#histX <- as.numeric(dataFilter$Global_active_power)

# png default parameters are: width = 480, height = 480 so no need to override
png(filename="plot1.png")
hist(histX, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", )
dev.off()
