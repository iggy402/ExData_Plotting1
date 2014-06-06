df.data <- read.csv2("~/Documents/household_power_consumption.txt", stringsAsFactors = FALSE)
#Trim to the dates we care about.
df.data.trim <- df.data[df.data$Date == "1/2/2007" | df.data$Date == "2/2/2007",]
#Convert from char to POSIXt
df.data.trim$DateTime <- as.POSIXct(strptime(paste(df.data.trim$Date, df.data.trim$Time), format = "%d/%m/%Y %H:%M:%S"))
##Histogram of global active power
df.data.trim$Sub_metering_1 <- as.numeric(df.data.trim$Sub_metering_1)
df.data.trim$Sub_metering_2 <- as.numeric(df.data.trim$Sub_metering_2)
df.data.trim$Sub_metering_3 <- as.numeric(df.data.trim$Sub_metering_3)
df.data.trim$Global_active_power <- as.numeric(df.data.trim$Global_active_power)
df.data.trim$Voltage <- as.numeric(df.data.trim$Voltage)
df.data.trim$Global_reactive_power <- as.numeric(df.data.trim$Global_reactive_power)

png(filename = "~/Documents/plot4.png",
    width = 480, height = 480, bg = "transparent")

#Allows us to have 4 plots.
par(mfrow = c(2,2))
par(mar = c(4, 4, 2, 2))

#1
plot(df.data.trim$DateTime, df.data.trim$Global_active_power, main="", ylab = "Global Active Power (kilowatts)", xlab = "",type = "n") 
lines(df.data.trim$DateTime, df.data.trim$Global_active_power)

#2
plot(df.data.trim$DateTime, df.data.trim$Voltage, main="", ylab = "Voltage", xlab = "datetime", type="n") 
lines(df.data.trim$DateTime, df.data.trim$Voltage)

#3
plot(df.data.trim$DateTime, df.data.trim$Sub_metering_1, main="", ylab = "Energy sub metering", xlab = "",type = "n") 
lines(df.data.trim$DateTime, df.data.trim$Sub_metering_1, col="black")
lines(df.data.trim$DateTime, df.data.trim$Sub_metering_2, col="red")
lines(df.data.trim$DateTime, df.data.trim$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty="n")

#4
plot(df.data.trim$DateTime, df.data.trim$Global_reactive_power, main="", ylab = "Global_reactive_power", xlab = "datetime", type="n") 
lines(df.data.trim$DateTime, df.data.trim$Global_reactive_power)

dev.off()
