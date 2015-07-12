df <- read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors = F, na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- subset(df, Date=="2007-02-01" | Date=="2007-02-02")
df$Time <- strptime(paste(df$Date,df$Time), "%Y-%m-%d %H:%M:%S")


png("plot1.png", width = 480, height = 480)
hist(x = df$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col="red", main = "Global Active Power")
dev.off()