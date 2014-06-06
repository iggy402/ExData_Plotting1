df.data <- read.csv2("~/Documents/household_power_consumption.txt", stringsAsFactors = FALSE)
#Trim to the dates we care about.
df.data.trim <- df.data[df.data$Date == "1/2/2007" | df.data$Date == "2/2/2007",]
#Convert from char to POSIXt to Date
df.data.trim$Date <- as.Date(strptime(df.data.trim$Date, format = "%d/%m/%Y"))
#Histogram of global active power
df.data.trim$Global_active_power <- as.numeric(df.data.trim$Global_active_power)

png(filename = "~/Documents/Figure1.png",
    width = 480, height = 480)

hist(df.data.trim$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="orangered3") 

dev.off()