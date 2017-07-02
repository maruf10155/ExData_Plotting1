# loding packages
library(lubridate)
library(data.table)
library(dplyr)
a=fread("ExData_Plotting1/household_power_consumption.txt",na.strings = c("?")) # loading datasets
a1=filter(a,dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02") # subsetting the required dataset
setwd("ExData_Plotting1") # set working directory
a2=dmy(a1$Date)+hms(a1$Time)
a1$timedate=a2 # creating a column
par("mfrow"=c(2,2)) # show 4 plots in one device
# plotting 4 plots 
plot(a1$timedate,a1$Global_active_power,ylab = "Global Active Power",type = "s",xlab = " ") # 1st plot
plot(a1$timedate,a1$Voltage,ylab = "Voltage",type = "s",xlab = "datetime") # 2nd plot
with(a1,plot(timedate,Sub_metering_1,xlab=" ",ylab="Energy sub metering",type="s")) # 3rd plot 
with(a1,lines(timedate, Sub_metering_2,col="red"))
with(a1,lines(timedate, Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),lty="solid",
legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(a1$timedate,a1$Global_reactive_power,xlab = "datetime",type="s",ylab = "Global_reactive_power") # 4th plot
dev.copy(png, width=480, height=480, file = "plot4.png") # copy to a device
dev.off() # closing the device
