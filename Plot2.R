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

## Create the Plot2
png("Plot2.png", width = 480, height = 480, units = "px")
plot(hpc_dates$Date_Time, hpc_dates$Global_active_power, ylab = "Global Active Power (kilowatts)",
     xlab = " ", pch = "")
lines(hpc_dates$Date_Time, hpc_dates$Global_active_power, lwd = 1)     
dev.off()
