##Plot3.R
## Assigning the filname to a variable

datafile<-"household_power_consumption.txt"

## Reading the datafile

Projectdata<-read.table(datafile,sep=";",header=TRUE,colClasses = c("character","character",rep("numeric",7)),
                        na.strings="?")

## Converting the Date column from character to Date class

Projectdata$Date<-as.Date(Projectdata$Date,"%d/%m/%Y")

##Extracting the required no. of rows from the data file

Parseddata<-Projectdata[(Projectdata$Date == "2007-02-01" | Projectdata$Date == "2007-02-02"),]

## Concatanating the date and time columns and converting the datetime variable in the format specified

Parseddata$datetime<-strptime(paste(Parseddata$Date,Parseddata$Time,sep=" "), "%Y-%m-%d %H:%M:%S")

##Saving the plots to file 

png(filename="plot3.png",width=480,height=480,units="px")

##Creating the plot

plot(Parseddata$datetime,Parseddata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

## Adding the line for Sub_metering_2

lines(Parseddata$datetime,Parseddata$Sub_metering_2,type="l",col="red")

## Adding the line for Sub_metering_3

lines(Parseddata$datetime,Parseddata$Sub_metering_3,type="l",col="blue")

## Adding the legend

legend("topright",col=c("black","red","blue"),cex=0.8,lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Closing the file

dev.off()


