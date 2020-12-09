#Read the data
dataFile <- "household_power_consumption.txt"

hpc <- read.table("household_power_consumption.txt",
                  header=TRUE,
                  sep=";",
                  stringsAsFactors=FALSE,
                  dec=".")

#Subset the data
subsetHpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#merge date and time and convert to a datetime object (x-axis)
datetime <- strptime(paste(subsetHpc$Date, subsetHpc$Time,
                           sep=" "),
                     "%d/%m/%Y %H:%M:%S")

#Get globalActivePower (y-axis)
globalActivePower <- as.numeric(subsetHpc$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
