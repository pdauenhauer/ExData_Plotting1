#set working directory
setwd("D:/R Programming")

#read only the data for the two days specified in the assignment
library(sqldf)
data<-read.csv.sql("household_power_consumption.txt",sql="SELECT * from file 
                   WHERE Date in ('1/2/2007','2/2/2007')", sep=";", header=TRUE)

#add new column to data table with concatenated data and time converted to a recognisable data format
data$TimeDate<-strptime(paste(data$Date, data$Time, sep=","),format="%d/%m/%Y,%H:%M:%S")

#plot the data and save it as a png file
dev.copy(png,file="plot3.png")
plot(data$TimeDate,data$Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering")
lines(data$TimeDate,data$Sub_metering_2,col="red")
lines(data$TimeDate,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()