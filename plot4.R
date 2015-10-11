# set working directory for project 
setwd("C:/Users/Bryan/Documents/CourseEra_DS_Specializaiton/ch4_EDA/assignment1/project1")

classes <- rep("character", 9)
# read in entire unzipped dataset from current working directory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = classes)

# convert variables from class "character" to "date" or "numeric"
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)

# subset dataset to only the dates we want 
data <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

# create plot 4
par(mfcol=c(2,2))  # fill column-wise 
with(data,{
  # first subplot (same as plot2)
  plot(data$Global_active_power, type = "l", ylab = "Global Active Power", xaxt = "n", xlab = "")
  axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
  
  # second subplot (same as plot3)
  plot(data$Sub_metering_1, ylab = "Energy sub metering", xaxt = "n", xlab = "", type="l")
  points(data$Sub_metering_2, col= "red", type= "l")
  points(data$Sub_metering_3, col= "blue", type= "l")
  axis(1,at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"),lwd=1)
  
  # third subplot
  plot(data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
  axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
  
  # fourth subplot
  plot(data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
  axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
  })

# copy plot to a png file
dev.copy(png,file="plot4.png")
dev.off()