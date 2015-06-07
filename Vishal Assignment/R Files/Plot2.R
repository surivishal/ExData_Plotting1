raw_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
#raw_data1 <- raw_data
raw_data1$Date <- as.Date(raw_data1$Date,"%d/%m/%Y")

newdata <- raw_data
newdata$Date <- as.Date(raw_data1$Date,"%d/%m/%Y")

newdata1 <- subset(raw_data1,Date=="2007-02-01")
newdata2 <- subset(raw_data1,Date=="2007-02-02")
newdata <- rbind(newdata1,newdata2)
newdata$Global_active_power <- as.numeric(as.vector(newdata$Global_active_power))

#plot 2
datetime <-as.POSIXlt(paste(as.Date(newdata$Date, format="%d/%m/%Y"), newdata$Time, sep=" "))
png("plot2.png",width=480,height=480,units="px")
plot(datetime,newdata$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts")
dev.off()