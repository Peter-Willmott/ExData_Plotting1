# Assumes "household_power_consumption.txt" is in your working directory

library(lubridate)

# open file 
png(filename="plot2.png",width = 480, height = 480)

# load data, clear na(?), set column classes
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c(rep('character',2),rep('numeric',7)))
# restrict dates
plot_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

# Create a DateTime variable
plot_data$DateTime <- dmy(plot_data$Date)+hms(plot_data$Time)

# plot graph
plot(plot_data$DateTime, plot_data$Global_active_power,  xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# close file
dev.off()
