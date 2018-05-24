#This R Code aims to read the household_power_consumption data from Feb. 1 - Feb. 2, 2007, 
#then subsequently plot 4 graphs into one file:

  #1 histogram illustrating the frequency of Global Active Power
  #2 line graph illustrating the value of each sub_metering (from 1-3)
  #3 line graph illustrating the value of Voltage for each time period
  #4 line graph illustrating the value of Global Reactive Power for each time period

#Graph is then saved into a png file called plot4.

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

#step 4: set screen to accomodate four graphs

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

#step 5: plot first graph

plot(data$Global_active_power~data$CompleteTime, type = "l", xlab = "",
     ylab = "Global Active Power")

#step 6: plot second graph

plot(data$Sub_metering_1~data$CompleteTime, col ="black", type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(data$Sub_metering_2~data$CompleteTime, col ="red", type = "l")
lines(data$Sub_metering_3~data$CompleteTime, col ="blue", type = "l")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"), lty = 1, lwd = 2)

#step 7: plot third graph

plot(data$Voltage~data$CompleteTime, type = "l", xlab = "datetime",
     ylab = "Voltage")

#step 8: plot fourth graph

plot(data$Global_reactive_power~data$CompleteTime, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

#step 9: close dev to save png

dev.off()


