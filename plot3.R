dt = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",as.is = TRUE)

dt$Time = strptime(paste(dt$Date,dt$Time), " %d/%m/%Y %H:%M:%S")
dt$Date = as.Date(dt$Date,"%d/%m/%Y")
date_min = as.Date("2007-02-01")
date_max = as.Date("2007-02-02")
dt = dt[(dt$Date >= date_min & dt$Date <= date_max),]

png(file = "plot3.png", width = 480, height = 480)
yrange =range(c(dt$Sub_metering_1,dt$Sub_metering_2,dt$Sub_metering_3))
plot(dt$Time, dt$Sub_metering_1,type="l",ylim=yrange, xlab = " ", ylab = "Energy sub metering")
lines(dt$Time, dt$Sub_metering_2, col = "red")
lines(dt$Time, dt$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty = 1,col = c("black","red","blue"))
dev.off()
