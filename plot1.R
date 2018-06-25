# Assumes "household_power_consumption.txt" is in your working directory

# open file
png(filename="plot1.png",width = 480, height = 480)

# load data, clear na(?), set column classes
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c(rep('character',2),rep('numeric',7)))
# restrict dates
plot_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

# plot hist
hist(plot_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

# close file
dev.off()
