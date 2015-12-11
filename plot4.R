setwd("C:/coursera/ExData_Project1")
datafile<-"household_power_consumption.txt"
power <- read.table(datafile, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

##PLOT 1
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 2
plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

##PLOT 3
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,type="l", col="red")
lines(df$timestamp,df$Sub_metering_3,type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#PLOT 4
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()