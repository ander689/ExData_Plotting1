#set directory
setwd("~./Documents/Coursera/ExploratoryData")
#read wanted data, and name the column headers appropriately
date1<-read.table("./household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows = 2878)
name<-read.table("./household_power_consumption.txt",header = T,nrow=1)
colnames(date1)<-strsplit(names(name),split=".",fixed=T)[[1]]
#extract datetime
dateTime <- strptime(paste(date1$Date, date1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#set plot specifications
par(mfrow=c(2,2),mar=c(4,4,1,1))
#plot1
plot(dateTime, as.numeric(date1$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
#plot2
plot(dateTime,date1$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot3
plot(dateTime,date1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")+
  lines(dateTime,date1$Sub_metering_2,col="red")+
  lines(dateTime,date1$Sub_metering_3,col="blue")+
  legend("topright",y=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, lwd=2.5,bty="n",cex=.7)
#plot4
plot(dateTime,date1$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
