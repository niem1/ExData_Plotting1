## This file is a script to read in the data for exercise 1
## then plot the data 
##
## First read in the data
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".")
## Now select only the dates we are interested in
##
datesanddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##
## Convert the date and time
datetime <- strptime(paste(datesanddata$Date, datesanddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##
## Now select the columns we need for this plot
gap<-as.numeric(datesanddata[,3])
subM1 <- as.numeric(datesanddata$Sub_metering_1)
subM2 <- as.numeric(datesanddata$Sub_metering_2)
subM3 <- as.numeric(datesanddata$Sub_metering_3)
## Set the name and resolution of the plot
png("plot3.png", width=480, height=480)
## Call the plotting function
plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()
##