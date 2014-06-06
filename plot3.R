df.data <- read.csv2("~/Documents/household_power_consumption.txt", stringsAsFactors = FALSE)
#Trim to the dates we care about.
df.data.trim <- df.data[df.data$Date == "1/2/2007" | df.data$Date == "2/2/2007",]
#Convert from char to POSIXt
df.data.trim$DateTime <- as.POSIXct(strptime(paste(df.data.trim$Date, df.data.trim$Time), format = "%d/%m/%Y %H:%M:%S"))
##Histogram of global active power
df.data.trim$Sub_metering_1 <- as.numeric(df.data.trim$Sub_metering_1)
df.data.trim$Sub_metering_2 <- as.numeric(df.data.trim$Sub_metering_2)
df.data.trim$Sub_metering_3 <- as.numeric(df.data.trim$Sub_metering_3)

png(filename = "~/Documents/plot3.png",
    width = 480, height = 480, bg = "transparent")

#add a blank canvas.
plot(df.data.trim$DateTime, df.data.trim$Sub_metering_1, main="", ylab = "Energy sub metering", xlab = "",type = "n") 

#add the lines.
lines(df.data.trim$DateTime, df.data.trim$Sub_metering_1, col="black")
lines(df.data.trim$DateTime, df.data.trim$Sub_metering_2, col="red")
lines(df.data.trim$DateTime, df.data.trim$Sub_metering_3, col="blue")

#Add a legend.
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

dev.off()
