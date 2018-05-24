#This R Code aims to read the household_power_consumption data, then
#subsequently plot a histogram illustrating the frequency of Global Active
#Power from Feb. 1 - Feb. 2, 2007.

#Graph is then saved into a png file called plot1.

#step 1: read data from file

rawdata <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#step 2: take subset of relevant period

data <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

# step 3: plot data into png file

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

dev.off()


