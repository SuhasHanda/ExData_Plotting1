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
plot(datetime,Global_active_power,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.copy(png,"Plot2.png")
dev.off()
