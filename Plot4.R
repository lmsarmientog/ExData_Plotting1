setwd("C:/Users/Luz M/Documents/MyDevelopment/Courses/Coursera/Data_Science/Course 4 Exploratory Data Analysis/Week 1/Assignment")


hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
View(hpc)

library(dplyr)

hpc <- mutate(hpc, Date_Time = paste(hpc$Date, hpc$Time)) 
hpc$Date_Time <- strptime(hpc$Date_Time, format = "%d/%m/%Y %H:%M:%S")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

## Filter the data according to the assignment

hpc_dates <- filter(hpc, Date =="2007-02-01"| Date =="2007-02-02")
hpc_dates <- filter(hpc_dates, Global_active_power != "?")

## Create the Plot4

png("Plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(hpc_dates, {
  plot(Date_Time, Global_active_power, ylab = "Global Active Power (kilowatts)",
     xlab = " ", pch = "")
  lines(Date_Time, Global_active_power, lwd = 1)
  plot(Date_Time, Voltage, pch = "", xlab = "Datetime")
  lines(Date_Time, Voltage, lwd = 1)
  plot(Date_Time, Sub_metering_1, pch = "", xlab = "",
       ylab = "Energy sub metering")
  lines(Date_Time, Sub_metering_1, lty = 1)
  lines(Date_Time, Sub_metering_2, col = "red", lty = 1)
  lines(Date_Time, Sub_metering_3, col = "blue", lty = 1)
  legend("topright", lty = 1, col = c("black","red","blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Date_Time, Global_reactive_power, xlab = "Datetime", pch = "")
  lines(Date_Time, Global_reactive_power, lwd = 1)
  
})
    
dev.off()
