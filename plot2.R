setwd("C:/Users/Sony LapTop User/Dropbox/CourseraProgrammingClass/Exploratory Data Analysis/Project 1")

#Download zip file from website and load relevant subset into R
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination <- "file.zip"
download.file(url=fileUrl, destfile=destination, mode="wb") 

#Read the relevant subset of the data into R. 
#install.packages("sqldf")
library(sqldf)

dat3 <- read.csv.sql(file="household_power_consumption.txt",sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",header=TRUE,sep=";")
closeAllConnections()

#Plot a time series  of "Global Active Power" and save file to the current working directory
dateTime   <- as.POSIXlt(paste(as.Date(dat3$Date, format="%d/%m/%Y"), dat3$Time, sep=" "))  #  Combine "date" and "Time" into one variable
png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(dateTime,dat3$Global_active_power,ylab="Global Active Power(killowatts)",type="l",xlab="")
dev.off()
