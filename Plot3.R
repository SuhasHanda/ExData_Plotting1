setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y %H:%M") )

energydata<-read.table("household_power_consumption.txt",
                       header = T,sep = ";",nrows = 2075259,
                       colClasses = c("character","character","numeric","numeric",
                                      "numeric","numeric","numeric","numeric","numeric")
                       ,na.strings = "?")
plotdata<-subset(energydata,energydata$Date=="2007-02-01"|
                     energydata$Date=="2007-02-02")

plotdata$datetime<-strptime(paste(plotdata$Date,plotdata$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
attach(plotdata)
plot(datetime,Sub_metering_1,type = "l",xlab="",
     ylab = "Energy Sub Metering",col="black")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),
       col=c("black","red","blue"),lty = 1)

dev.copy(png,"Plot3.png")
dev.off()
