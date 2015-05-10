# plot 3

# load data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

# subset data
ss <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# convert Global_active_power to numeric, combine Date and time
ss$Global_active_power <- as.numeric(ss$Global_active_power)
ss$DateTime <- strptime(paste(ss$Date, ss$Time), "%d/%m/%Y %T")

# conver sub meterings to numeric
ss$Sub_metering_1 <- as.numeric(ss$Sub_metering_1)
ss$Sub_metering_2 <- as.numeric(ss$Sub_metering_2)
ss$Sub_metering_3 <- as.numeric(ss$Sub_metering_3)

# open png device
png(filename = "plot3.png")

# draw plot
with(ss, {
  plot(DateTime, Sub_metering_1,
       type = "l",
       xlab = "",
       ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"),
         lty = 1,
         legend = c("Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3"))
})

# close device
dev.off()