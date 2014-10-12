#set working directory
setwd("D:/R Programming")

#read only the data for the two days specified in the assignment
library(sqldf)
data<-read.csv.sql("household_power_consumption.txt",sql="SELECT * from file 
                   WHERE Date in ('1/2/2007','2/2/2007')", sep=";", header=TRUE)

#plot the data and save it as a png file
plot1<-hist(data$Global_active_power)

png(filename="D:/R Programming/plot1.png")
plot(plot1,xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")
dev.off()