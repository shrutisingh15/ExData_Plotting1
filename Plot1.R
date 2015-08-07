##Plot1.R
## Assigning the filname to a variable
datafile<-"household_power_consumption.txt"
## Reading the datafile
Projectdata<-read.table(datafile,sep=";",header=TRUE,colClasses = c("character","character",rep("numeric",7)),
                        na.strings="?")

## Converting the Date column from character to Date class.
Projectdata$Date<-as.Date(Projectdata$Date,"%d/%m/%Y")

##Extracting the required no. of rows from the data file
Parseddata<-Projectdata[(Projectdata$Date == "2007-02-01" | Projectdata$Date == "2007-02-02"),]

## Concatanating the date and time columns and converting the datetime variable in the format specified.
Parseddata$datetime<-strptime(paste(Parseddata$Date,Parseddata$Time,sep=" "), "%Y-%m-%d %H:%M:%S")

##Saving the plots to file 
png(filename="plot1.png",width=480,height=480,units="px")


##Creating the plot
hist(Parseddata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

## closing the file
dev.off()

