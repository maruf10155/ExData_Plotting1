# loading packages
library(lubridate)
library(data.table)
library(dplyr)
a=fread("ExData_Plotting1/household_power_consumption.txt",na.strings = c("?")) #loading the dataset
a1=filter(a,dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02") # subsetting
setwd("ExData_Plotting1") # set working directory
a2=dmy(a1$Date)+hms(a1$Time)
png(file="plot2.png",width =480,height = 480 ) # open a device
plot(a2,a1$Global_active_power,type = "s",xlab = " ",ylab = "Global Active Power (killowatts") # plotting 
dev.off() # closing device
