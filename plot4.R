#set working directory
setwd("D:/R Programming")

#read only the data for the two days specified in the assignment
library(sqldf)
data<-read.csv.sql("household_power_consumption.txt",sql="SELECT * from file 
                   WHERE Date in ('1/2/2007','2/2/2007')", sep=";", header=TRUE)

#add new column to data table with concatenated data and time converted to a recognisable data format
data$TimeDate<-strptime(paste(data$Date, data$Time, sep=","),format="%d/%m/%Y,%H:%M:%S")

#plot the data and save it as a png file
dev.copy(png,file="plot4.png")
par(mfrow=c(2,2))

#plot upper left corner
plot(data$TimeDate, data$Global_active_power,type="l", main="",xlab="",
     ylab="Global Active Power (kilowatts)")

#plot upper right corner
plot(data$TimeDate, data$Voltage,type="l", main="",xlab="datetime",
     ylab="Voltage")

#plot lower left corner
plot(data$TimeDate,data$Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering")
lines(data$TimeDate,data$Sub_metering_2,col="red")
lines(data$TimeDate,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n",cex=0.75)

#plot lower right corner
plot(data$TimeDate, data$Global_reactive_power,type="l",main="",xlab="datetime",
     ylab="Global_reactive_power")

dev.off()