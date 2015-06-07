raw_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
#raw_data1 <- raw_data
raw_data1$Date <- as.Date(raw_data1$Date,"%d/%m/%Y")

newdata <- raw_data
newdata$Date <- as.Date(raw_data1$Date,"%d/%m/%Y")

newdata1 <- subset(raw_data1,Date=="2007-02-01")
newdata2 <- subset(raw_data1,Date=="2007-02-02")
newdata <- rbind(newdata1,newdata2)
#newdata$Global_active_power <- as.numeric(as.vector(newdata$Global_active_power))
newdata$Sub_metering_1 <- as.numeric(as.vector(newdata$Sub_metering_1))
newdata$Sub_metering_2 <- as.numeric(as.vector(newdata$Sub_metering_2))
newdata$Sub_metering_3 <- as.numeric(as.vector(newdata$Sub_metering_3))

#plot 3
datetime <-as.POSIXlt(paste(as.Date(newdata$Date, format="%d/%m/%Y"), newdata$Time, sep=" "))
png("plot3.png",width=480,height=480,units="px")

plot(datetime,newdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=c(0,40))
points(datetime,newdata$Sub_metering_2,type="l",col="red")
points(datetime,newdata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

dev.off()
