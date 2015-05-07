# read text file - I read only part of the data that contains data relevant for assignment 
# (helping my memory to process the data)

mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66000,nrows =50000, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# take only the proper days
gooddata <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007", ]


#read data as numeric
cleandata_sm1 <- as.numeric(as.character(gooddata$Sub_metering_1))
cleandata_sm2 <- as.numeric(as.character(gooddata$Sub_metering_2))
cleandata_sm3 <- as.numeric(as.character(gooddata$Sub_metering_3))

#convert date and time
gooddata$TimeDate = paste(gooddata$Date , gooddata$Time, sep=" ")  
gooddata$TimeDateGood <- strptime(gooddata$TimeDate, format="%e/%m/%Y %T")

#plot and save to png
png(filename="plot3.png", width = 480, height = 480, units = "px")
plot.new()
plot(gooddata$TimeDateGood, cleandata_sm1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(gooddata$TimeDateGood, cleandata_sm2, col="red")
lines(gooddata$TimeDateGood, cleandata_sm3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"))
dev.off()

