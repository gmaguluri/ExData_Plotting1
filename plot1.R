setwd("C:/coursera/ExData_Project1")
datafile<-"household_power_consumption.txt"
power <- read.table(datafile, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
png("plot1.png", width=480, height=480 )
hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.off()
