# Read the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", 
                 colClasses = c("character", "character", rep("numeric", 7)))

# Subset data for specific dates
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Plot 1: Histogram of Global Active Power
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")

# Save plot as PNG
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()