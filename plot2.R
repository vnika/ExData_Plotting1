dt = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",as.is = TRUE)

dt$Time = strptime(paste(dt$Date,dt$Time), " %d/%m/%Y %H:%M:%S")
dt$Date = as.Date(dt$Date,"%d/%m/%Y")
date_min = as.Date("2007-02-01")
date_max = as.Date("2007-02-02")
dt = dt[(dt$Date >= date_min & dt$Date <= date_max),]

png(file = "plot2.png", width = 480, height = 480)
plot(dt$Time, dt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
