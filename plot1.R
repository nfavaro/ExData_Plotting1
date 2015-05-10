# plot 1

# load data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

# subset data
ss <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# convert Global_active_power to numeric
ss$Global_active_power <- as.numeric(ss$Global_active_power)

# open png device
png(filename = "plot1.png")

# draw plot
hist(ss$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# close device
dev.off()