setwd('./EDA')
unzip("exdata_data_household_power_consumption.zip")
powcon<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
#Now lets see some data to see how values are coded under each variables such as date. 
head(powcon)
#We know what date values look like and hence can use exact matching strings to subset days of interest.
powcondata<-powcon[(powcon$Date %in% c("1/2/2007" , "2/2/2007")), ]
str(powcondata)
#We notice that date and time are read as factors.Hence lets convert to date/time class.
powcondata$datetime <- strptime(paste(powcondata$Date, powcondata$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot3.png")
plot(x =powcondata$datetime, y=powcondata$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
lines(x =powcondata$datetime, y=powcondata$Sub_metering_2, col="red")
lines(x =powcondata$datetime, y=powcondata$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()