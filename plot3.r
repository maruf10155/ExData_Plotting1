# loading packages
library(lubridate)
library(data.table)
library(dplyr)
a=fread("ExData_Plotting1/household_power_consumption.txt",na.strings = c("?")) # loading dataset
a1=filter(a,dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02") # subsetting required dataset
setwd("ExData_Plotting1") # set working directory
a2=dmy(a1$Date)+hms(a1$Time)
a1$timedate=a2 # creating a column 
# combine three plots in one plot
with(a1,plot(timedate,Sub_metering_1,ylab="Energy sub metering",type="s"))
with(a1,lines(timedate, Sub_metering_2,col="red"))
with(a1,lines(timedate, Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) # create legend
dev.copy(png, width=480, height=480, file = "plot3.png") # copy to a device
dev.off() # closing device
