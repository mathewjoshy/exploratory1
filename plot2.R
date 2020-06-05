library(lubridate)
#to read and subset data
house <- read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
sub <- subset(house, Date == "1/2/2007" | Date == "2/2/2007")
sub$datetime <- dmy_hms(paste(sub$Date,sub$Time))
#to create plot
plot(sub$datetime, sub$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.copy(png,file= "plot2.png", height = 480, width = 480)
dev.off()