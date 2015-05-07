# read text file - I read only part of the data that contains data relevant for assignment 
# (helping my memory to process the data)

mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66000,nrows =50000, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# take only the proper days
gooddata <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007", ]

#read Global Active Power data as numeric
cleandata_gap <- as.numeric(as.character(gooddata$Global_active_power))

#read Voltage data as numeric
cleandata_v <- as.numeric(as.character(gooddata$Voltage))

#read Sub metering data as numeric
cleandata_sm1 <- as.numeric(as.character(gooddata$Sub_metering_1))
cleandata_sm2 <- as.numeric(as.character(gooddata$Sub_metering_2))
cleandata_sm3 <- as.numeric(as.character(gooddata$Sub_metering_3))

#read Global_reactive_powere data as numeric
cleandata_grp <- as.numeric(as.character(gooddata$Global_reactive_power))

#convert date and time
gooddata$TimeDate = paste(gooddata$Date , gooddata$Time, sep=" ")  
gooddata$TimeDateGood <- strptime(gooddata$TimeDate, format="%e/%m/%Y %T")

#plot and save to png
png(filename="plot4.png", width = 480, height = 480, units = "px")
plot.new()
par(mfrow = c(2, 2))
#plot 1
plot(cleandata_time, cleandata_gap, type = "l", ylab = "Global Active Power", xlab = "")

#plot 1
plot(cleandata_time, cleandata_v, type = "l", ylab = "Voltage", xlab = "datetime")


#plot 3
plot(gooddata$TimeDateGood, cleandata_sm1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(gooddata$TimeDateGood, cleandata_sm2, col="red")
lines(gooddata$TimeDateGood, cleandata_sm3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"), bty = "n")

#plot 1
plot(cleandata_time, cleandata_grp, type = "l", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()