setwd("C:/Users/Luz M/Documents/MyDevelopment/Courses/Coursera/Data_Science/Course 4 Exploratory Data Analysis/Week 1/Assignment")


hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
View(hpc)

library(dplyr)

hpc <- mutate(hpc, Date_Time = paste(hpc$Date, hpc$Time)) 
hpc$Date_Time <- strptime(hpc$Date_Time, format = "%d/%m/%Y %H:%M:%S")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

## Filter the data according to the assignment

hpc_dates <- filter(hpc, Date =="2007-02-01"| Date =="2007-02-02")
sm1 <- filter(hpc_dates, Sub_metering_1 != "?")
sm2 <- filter(hpc_dates, Sub_metering_2 != "?")
sm3 <- filter(hpc_dates, Sub_metering_3 != "?")

## Create the Plot3

png("Plot3.png", width = 480, height = 480, units = "px")
plot(sm1$Date_Time, sm1$Sub_metering_1, pch = "", xlab = "",
     ylab = "Energy sub metering")
lines(sm1$Date_Time, sm1$Sub_metering_1, lty = 1)
lines(sm2$Date_Time, sm2$Sub_metering_2, col = "red", lty = 1)
lines(sm3$Date_Time, sm3$Sub_metering_3, col = "blue", lty = 1)
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

