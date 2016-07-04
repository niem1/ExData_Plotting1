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
## Now select the column we need for this plot
gap<-as.numeric(datesanddata[,3])
## Set the name and resolution of the plot
png("plot1.png", width=480, height=480)
## Call the plotting function
hist(gap, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
## Don't know why this is required but otherwise plot doesn't close
dev.off()
##