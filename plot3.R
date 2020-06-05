library(lubridate)
#to read and subset data
house <- read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
sub <- subset(house, Date == "1/2/2007" | Date == "2/2/2007")
sub$datetime <- dmy_hms(paste(sub$Date,sub$Time))
#to create plot
png("plot3.png", width=480, height=480)
plot(sub$datetime,sub$Sub_metering_1,type = "l",ylab="Energy Submetering", xlab="")
points(sub$datetime,sub$Sub_metering_2,type = "l", col="red")
points(sub$datetime,sub$Sub_metering_3,type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()