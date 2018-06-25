# Assumes "household_power_consumption.txt" is in your working directory

library(lubridate)

# open file
png(filename="plot4.png",width = 480, height = 480)

# load data, clear na(?), set column classes
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c(rep('character',2),rep('numeric',7)))
# restrict dates
plot_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

# create a DateTime variable
plot_data$DateTime <- dmy(plot_data$Date)+hms(plot_data$Time)

# set layout (mfrow)
par(mfrow=c(2,2))

#(1,1)
plot(plot_data$DateTime, plot_data$Global_active_power,  xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#(1,2)
plot(plot_data$DateTime, plot_data$Voltage,  xlab = "datetime", ylab = "Voltage", type = "l")

#(2,1)
plot(plot_data$DateTime, plot_data$Sub_metering_1,  xlab = "", ylab = "Energy sub metering", type = "l")
lines(plot_data$DateTime, plot_data$Sub_metering_2, col = "red")
lines(plot_data$DateTime, plot_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = "solid", col = c("black","red","blue"))

#(2,2)
plot(plot_data$DateTime, plot_data$Global_reactive_power,  xlab = "", ylab = "Global_rective_power", type = "l")

# close file
dev.off()
