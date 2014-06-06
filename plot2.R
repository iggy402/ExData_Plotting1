df.data <- read.csv2("~/Documents/household_power_consumption.txt", stringsAsFactors = FALSE)
#Trim to the dates we care about.
df.data.trim <- df.data[df.data$Date == "1/2/2007" | df.data$Date == "2/2/2007",]
#Convert from char to POSIXt
df.data.trim$DateTime <- as.POSIXct(strptime(paste(df.data.trim$Date, df.data.trim$Time), format = "%d/%m/%Y %H:%M:%S"))
##Histogram of global active power
df.data.trim$Global_active_power <- as.numeric(df.data.trim$Global_active_power)

png(filename = "~/Documents/plot2.png",
    width = 480, height = 480, bg = "transparent")

plot(df.data.trim$DateTime, df.data.trim$Global_active_power, main="", ylab = "Global Active Power (kilowatts)", xlab = "",type = "n") 

lines(df.data.trim$DateTime, df.data.trim$Global_active_power)
dev.off()
