library(lubridate)
library(data.table)
library(dplyr)
a=fread("ExData_Plotting1/household_power_consumption.txt",na.strings = c("?"))
a1=filter(a,dmy(Date)=="2007-02-01"|dmy(Date)=="2007-02-02")
setwd("ExData_Plotting1")
png(file="plot1.png",width =480,height = 480 )
hist(a1$Global_active_power,col = "red",main = "Global Active Power", xlab = "Golbal Active Power (killowatts)",ylab = "Frequency")
dev.off()