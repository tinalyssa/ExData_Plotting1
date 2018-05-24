#This R Code aims to read the household_power_consumption data, then
#subsequently plot a line graph illustrating the value of Global Active 
#Power for every minute from Feb. 1 - Feb. 2, 2007.

#Graph is then saved into a png file called plot2.

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

png("plot2.png", width = 480, height = 480)

plot(data$Global_active_power~data$CompleteTime, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
