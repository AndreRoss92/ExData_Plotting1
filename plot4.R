#Read the data
hpc <- read.table("household_power_consumption.txt",
                  header=TRUE,
                  sep=";",
                  stringsAsFactors=FALSE,
                  dec=".")

#Subset the data
subsetHpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the relevant columns to  numeric vectors. 
subsetHpc<-transform(subsetHpc,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
subsetHpc<-transform(subsetHpc,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
subsetHpc<-transform(subsetHpc,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
subsetHpc<-transform(subsetHpc,Global_active_power=as.numeric(as.character(Global_active_power)))
subsetHpc<-transform(subsetHpc,Voltage=as.numeric(as.character(Voltage)))
subsetHpc<-transform(subsetHpc,Global_reactive_power=as.numeric(as.character(Global_reactive_power)))


#Concatenate the date and time columns into a single DateTime column
subsetHpc$DateTime<-paste(subsetHpc$Date,subsetHpc$Time,sep=" ")

#Use strptime to convert the DateTime to POSIXlt object
subsetHpc$DateTime<-strptime(subsetHpc$DateTime, "%d/%m/%Y %H:%M:%S")

#Open  the png graphics device. Target file is created by the name of plot3.png.
png(file="plot4.png")

#Setting the matrix for th plots.
par(mfrow=c(2,2))

#Plotting
plot(subsetHpc$DateTime,subsetHpc$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(subsetHpc$DateTime,subsetHpc$Voltage,type="l",ylab="Voltage",xlab="datetime")

#Plot 3
plot(subsetHpc$DateTime,subsetHpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(subsetHpc$DateTime,subsetHpc$Sub_metering_2,type = "l",col="red")
lines(subsetHpc$DateTime,subsetHpc$Sub_metering_3,type="l",col="blue")

#Now the legend for plot 3
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#Last plot
plot(subsetHpc$DateTime,subsetHpc$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#Close the device
dev.off()
