#Read the data
hpc <- read.table("household_power_consumption.txt",
                  header=TRUE,
                  sep=";",
                  stringsAsFactors=FALSE,
                  dec=".")

#Subset the data
subsetHpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#get the globalActivePower variable
globalActivePower <- as.numeric(subsetHpc$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
