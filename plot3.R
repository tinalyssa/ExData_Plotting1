#This R Code aims to read the household_power_consumption data, then
#subsequently plot a line graph illustrating the value of each sub_metering 
#(from 1-3) for every time period from Feb. 1 - Feb. 2, 2007.

#Graph would contain legend and would assign the color black to Sub_metering_1,
#red for Sub_metering_2, and blue for Sub_metering_3.

#Graph is then saved into a png file called plot3.

#step 1: read data from file

rawdata <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#step 2: take subset of relevant period

data <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

#step 3: with Date and Time columns stored as characters, it is first
#necessary to transform these columns into date formats to draw out data
#for each time period.

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$CompleteTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

#plot line graph into png file

png("plot3.png", width = 480, height = 480)

plot(data$Sub_metering_1~data$CompleteTime, col ="black", type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(data$Sub_metering_2~data$CompleteTime, col ="red", type = "l")
lines(data$Sub_metering_3~data$CompleteTime, col ="blue", type = "l")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"), lty = 1, lwd = 2)

dev.off()

