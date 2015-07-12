df <- read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors = F, na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- subset(df, Date=="2007-02-01" | Date=="2007-02-02")
df$Time <- strptime(paste(df$Date,df$Time), "%Y-%m-%d %H:%M:%S")


png("plot3.png", width = 480, height = 480)
plot(df$Time, df$Sub_metering_1, type="l", ylab="Energy sub metering",
     xlab="",col="black")
lines(df$Time, df$Sub_metering_2,col="red")
lines(df$Time, df$Sub_metering_3,col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c("black","red","blue"))
dev.off()