# loading packages
library(lubridate) 
library(data.table)
library(dplyr)
a=fread("ExData_Plotting1/household_power_consumption.txt",na.strings = c("?")) # load the dataset
a1=filter(a,dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02") # subsetting the required dataset
setwd("ExData_Plotting1") # set working directory
# plotting the histogram
png(file="plot1.png",width =480,height = 480 ) 
hist(a1$Global_active_power,col = "red",main = "Global Active Power", xlab = "Golbal Active Power (killowatts)",ylab = "Frequency")
dev.off() # closing the device
