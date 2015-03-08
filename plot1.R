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
png(filename="plot1.png")
hist(powcondata$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col = "red")
dev.off()