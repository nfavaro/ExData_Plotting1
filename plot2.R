# plot 2

# load data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

# subset data
ss <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# convert Global_active_power to numeric, combine Date and time
ss$Global_active_power <- as.numeric(ss$Global_active_power)
ss$DateTime <- strptime(paste(ss$Date, ss$Time), "%d/%m/%Y %T")

# open png device
png(filename = "plot2.png")

# draw plot
with(ss, plot(DateTime, Global_active_power,
              type = "l",
              xlab = "",
              ylab = "Global Active Power (kilowatts)"))

# close device
dev.off()