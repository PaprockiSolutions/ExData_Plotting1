# Read the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", 
                 colClasses = c("character", "character", rep("numeric", 7)))

# Subset data for specific dates
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert the Date variable to Date class using as.Date()
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Combine the Date and Time columns to create a DateTime variable
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %H:%M:%S")

# Plot 3: Energy Sub Metering
png("plot3.png", width = 480, height = 480)

plot(data$DateTime, data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)

axis(1, at = as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))

dev.off()