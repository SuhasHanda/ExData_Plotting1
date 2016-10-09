setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

energydata<-read.table("household_power_consumption.txt",
                       header = T,sep = ";",nrows = 2075259,
                       colClasses = c("myDate","character","numeric","numeric",
                                      "numeric","numeric","numeric","numeric","numeric")
                       ,na.strings = "?")
plotdata<-subset(energydata,energydata$Date=="2007-02-01"|
                     energydata$Date=="2007-02-02")
plotdata$datetime<-strptime(paste(plotdata$Date,plotdata$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
attach(plotdata)

par(mfrow=c(2,2),mar=c(3,4,1,1))

#-----r(1,1)
plot(datetime,Global_active_power,type = "l",xlab="",
     ylab = "Global Active Power")

#-----r(1,2)
plot(datetime,Voltage,type = "l")

#-----r(2,1)
plot(datetime,Sub_metering_1,type = "l",xlab="",
     ylab = "Energy Sub Metering",col="black")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),
       col=c("black","red","blue"),lty = 1,bty="n")
#-----r(2,2)
plot(datetime,Global_reactive_power,type = "l")
dev.copy(png,"Plot4.png")
dev.off()
