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
## Convert the date and time
datetime <- strptime(paste(datesanddata$Date, datesanddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##
## Now select the column we need for this plot
gap<-as.numeric(subSetData[,3])
## Set the name and resolution of the plot
png("plot2.png", width=480, height=480)
## Call the plotting function
plot(datetime,gap, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
## Don't know why this is required but otherwise plot doesn't close
dev.off()