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

$$Plot being saved as png file
png(filename = "plot1.png", width = 480, height = 480)
hist(DataNueva$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off() 
