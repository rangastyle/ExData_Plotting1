setwd("C:/Users/Sony LapTop User/Dropbox/CourseraProgrammingClass/Exploratory Data Analysis/Project 1")

#Download zip file from website and load relevant subset into R
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination <- "file.zip"
download.file(url=fileUrl, destfile=destination, mode="wb") 

#install.packages("sqldf")
library(sqldf)
dat3 <- read.csv.sql(file="household_power_consumption.txt",sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",header=TRUE,sep=";")
closeAllConnections()


#Plot histogram and save file as a png file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(dat3$Global_active_power,breaks ="sturges",col="red",main="Global Active Power"
,ylab="Frequency", xlab="Global Active Power(killowatts)")

dev.off()
