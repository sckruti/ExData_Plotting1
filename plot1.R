# Creating a variable that stores the location of file
dataFile <- "C:/Users/Kuntal/Desktop/KM_Homework/household_power_consumption.txt"

# Reading the file as a table. Keeping StringAsFActors as False 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


# Limiting the date criteria only to two dates that we are interested in
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#Subsetting only one variable that we are interested in
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()