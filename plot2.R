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

# Plot 2: Global Active Power over Time
plot(data$DateTime, data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")

axis(1, at = as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))

# Save plot as PNG
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()