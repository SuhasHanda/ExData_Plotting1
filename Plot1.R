setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
    
energydata<-read.table("household_power_consumption.txt",
           header = T,sep = ";",nrows = 2075259,
           colClasses = c("myDate","character","numeric","numeric",
                          "numeric","numeric","numeric","numeric","numeric")
           ,na.strings = "?")
plotdata<-subset(energydata,energydata$Date=="2007-02-01"|
                     energydata$Date=="2007-02-02")
attach(plotdata)
hist(Global_active_power,col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,"Plot1.png")
dev.off()
