setwd("C:/Users/Sony LapTop User/Dropbox/CourseraProgrammingClass/Exploratory Data Analysis/Project 1")

#Download zip file from website and load relevant subset into R
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination <- "file.zip"
download.file(url=fileUrl, destfile=destination, mode="wb") 


library(sqldf)
#Read the relevant subset of the data into R. 
#After Manually get the text file from downloaded zip file to working directory

dat3 <- read.csv.sql(file="household_power_consumption.txt",sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",header=TRUE,sep=";")
closeAllConnections()


#Plot a time series of "Global Reactive Power" and save it to the current working directory
dateTime<- as.POSIXlt(paste(as.Date(dat3$Date, format="%d/%m/%Y"), dat3$Time, sep=" "))

png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(dateTime,dat3$Global_active_power, type="l", ylab="Global Active Power",xlab="")
plot(dateTime,dat3$Voltage,type="l", ylab="Voltage")
plot(dateTime,dat3$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dateTime,dat3$Sub_metering_2, type="l",col="red")
lines(dateTime,dat3$Sub_metering_3, type="l",col="blue")
legend(x ="topright",col=c("black", "red", "blue"),lty=1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dateTime,dat3$Global_reactive_power, type="l", ylab="Global reactive Power")
dev.off()

