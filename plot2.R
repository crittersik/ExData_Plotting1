# First step - read text file 
# I read only part of the data that contains data relevant for assignment 
# (helping my memory to process the data)

mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66000,nrows =50000, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# take only the proper days
gooddata <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007", ]


#read data as numeric
cleandata_gap <- as.numeric(as.character(gooddata$Global_active_power))

#convert date and time
gooddata$TimeDate = paste(gooddata$Date , gooddata$Time, sep=" ")  
cleandata_time <- strptime(gooddata$TimeDate, format="%e/%m/%Y %T")


#plot and save to png
png(filename="plot2.png", width = 480, height = 480, units = "px")
plot.new()
plot(cleandata_time, cleandata_gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()