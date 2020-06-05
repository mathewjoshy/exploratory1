library(lubridate)
#to read and subset data
house <- read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
sub <- subset(house, Date == "1/2/2007" | Date == "2/2/2007")
sub$datetime <- dmy_hms(paste(sub$Date,sub$Time))
#to create plot
hist(sub$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png,file= "plot1.png", height = 480, width = 480)
dev.off()