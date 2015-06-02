# First step - read text file 
# I read only part of the data that contains data relevant for assignment 
# (helping my memory to process the data)

mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66000,nrows =50000, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# take only the proper days
gooddata <- mydata[mydata$Date == "2/2/2007" | mydata$Date == "1/2/2007", ]

#read data as numeric
cleandata_gap <- as.numeric(as.character(gooddata$Global_active_power))

#plot and save to png
png(filename="plot1.png", width = 480, height = 480, units = "px")
plot.new()
hist(cleandata_gap,freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
