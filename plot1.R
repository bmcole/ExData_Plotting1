# set working directory for project 
setwd("C:/Users/Bryan/Documents/CourseEra_DS_Specializaiton/ch4_EDA/assignment1/project1")

classes <- rep("character",9)
# read in entire unzipped dataset from current working directory
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = classes)

# convert date variable to object of class "Date"
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# convert global active power from character to numeric, "?'s" become NA's
data$Global_active_power <- as.numeric(data$Global_active_power)

# subset dataset to only the dates we want 
data <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

# Create plot 1 (a histogram)
par(mfrow=c(1,1))
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab= "Frequency", main = "Global Active Power",freq=TRUE)

# copy histogram to a png file
dev.copy(png,file="plot1.png")
dev.off()


