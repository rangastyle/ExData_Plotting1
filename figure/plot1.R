setwd("C:/Users/Sony LapTop User/Dropbox/CourseraProgrammingClass/Exploratory Data Analysis/Project 1")
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download zip file from website and load it into R
destination <- "file.zip"
download.file(url=fileUrl, destfile=destination, mode="wb") 
dat<- read.table(unz("file.zip","household_power_consumption.txt"),header=TRUE,sep=";")  

#######################
install.packages("sqldf")
#library(RSQLite.extfuns)
library(sqldf)
dat3 <- read.csv.sql(file="household_power_consumption.txt",sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",header=TRUE,sep=";")
closeAllConnections()

head(dat3)
tail(dat3)
dim(dat3)

names(dat3)
summary(dat3)
#head(dat3[dat3$Global_active_power=="?",])

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(dat3$Global_active_power,breaks ="sturges",col="red",main="Global Active Power"
,ylab="", xlab="Global Active Power(killowatts)")

dev.off()
