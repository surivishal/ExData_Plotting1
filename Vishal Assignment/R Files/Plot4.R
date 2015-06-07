raw_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
#raw_data1 <- raw_data
raw_data1$Date <- as.Date(raw_data1$Date,"%d/%m/%Y")

newdata <- raw_data
newdata$Date <- as.Date(raw_data1$Date,"%d/%m/%Y")

newdata1 <- subset(raw_data1,Date=="2007-02-01")
newdata2 <- subset(raw_data1,Date=="2007-02-02")
newdata <- rbind(newdata1,newdata2)

newdata$Global_active_power <- as.numeric(as.vector(newdata$Global_active_power))

newdata$Sub_metering_1 <- as.numeric(as.vector(newdata$Sub_metering_1))
newdata$Sub_metering_2 <- as.numeric(as.vector(newdata$Sub_metering_2))
newdata$Sub_metering_3 <- as.numeric(as.vector(newdata$Sub_metering_3))

newdata$Voltage<- as.numeric(as.vector(newdata$Voltage))

newdata$Global_reactive_power <- as.numeric(as.vector(newdata$Global_reactive_power))
datetime <-as.POSIXlt(paste(as.Date(newdata$Date, format="%d/%m/%Y"), newdata$Time, sep=" "))


png("plot4.png")
par(mfcol=c(2,2),mar=c(3,3,3,3))
#plot 1
plot(datetime,newdata$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.lab=1,cex.axis=1)
#plot 2
plot(datetime,newdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=c(0,40),cex.lab=1)
points(datetime,newdata$Sub_metering_2,type="l",col="red")
points(datetime,newdata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.75)

#plot 3
plot(datetime,newdata$Voltage,type="l",cex.lab=1,cex.axis=1,ylim=c(234,246))

#plot 4
plot(datetime,newdata$Global_reactive_power,type="l",cex.lab=1,cex.axis=1,ylim=c(0.0,0.5))

dev.off()