library(datasets)

##Download Data from website into local directory
FileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (file.exists("household_power_consumption.zip") == FALSE) {
  download.file(FileURL, destfile="household_power_consumption.zip", mode="wb")
}

##Unzip File in under same directory as where the household_power_consumption.zip file exist
unzip ("household_power_consumption.zip", exdir = ".")

## Read Data into R
DataNueva <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?") 

## Combine Date and time columns into a new one   
DataNueva$datetime <- strptime(paste(DataNueva$Date, DataNueva$Time), "%d/%m/%Y %H:%M:%S")

##Selecting only dates requested in project instructions
Fechas <- c(as.Date("2007-02-01"), as.Date("2007-02-02")) 
DataNueva <- DataNueva[as.Date(DataNueva$datetime) %in% Fechas,]

##Plot 3 being saved as png file
png(filename = "plot3.png", width = 480, height = 480)
with(DataNueva, plot(y=Sub_metering_1,x=datetime, type = "n",xlab ="", ylab="Energy sub metering")) 
with(DataNueva, lines(y=Sub_metering_1,x=datetime,col="black")) 
with(DataNueva, lines(y=Sub_metering_2,x=datetime,col="red")) 
with(DataNueva, lines(y=Sub_metering_3,x=datetime,col="blue")) 
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

dev.off()
