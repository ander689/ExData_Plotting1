#set directory
setwd("~./Documents/Coursera/ExploratoryData")
#read wanted data, and name the column headers appropriately
date1<-read.table("./household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows = 2878)
name<-read.table("./household_power_consumption.txt",header = T,nrow=1)
colnames(date1)<-strsplit(names(name),split=".",fixed=T)[[1]]
#extract datetime
dateTime <- strptime(paste(date1$Date, date1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plots
png("plot1.png", width=480, height=480)
  hist(date1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
