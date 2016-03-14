# Creating a variable that stores the location of file
dataFile <- "C:/Users/Kuntal/Desktop/KM_Homework/household_power_consumption.txt"

# Reading the file as a table. Keeping StringAsFActors as False 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


# Limiting the date criteria only to two dates that we are interested in
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating a temp data set that will contain concatenated date and time from file
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Creating a seperate file that contains only global active power
globalActivePower <- as.numeric(subSetData$Global_active_power)


png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

