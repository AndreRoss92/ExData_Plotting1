#Read the data
hpc<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

#Subset the data
subsetHpc<-subset(hpc,Date=="1/2/2007"| Date=="2/2/2007")

#Convert the sub_meterings columns to  numeric vectors. 
subsetHpc<-transform(subsetHpc,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
subsetHpc<-transform(subsetHpc,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
subsetHpc<-transform(subsetHpc,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))

#Concatenate the date and time columns into a single DateTime column
subsetHpc$DateTime<-paste(subsetHpc$Date,subsetHpc$Time,sep=" ")

#Use strptime to convert the DateTime to POSIXlt object
subsetHpc$DateTime<-strptime(subsetHpc$DateTime, "%d/%m/%Y %H:%M:%S")

#Open  the png graphics device. Target file is created by the name of plot3.png.
png(file="plot3.png")

#Plotting the Data. type="l" implies that the garph is a line chart.
plot(subsetHpc$DateTime,subsetHpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(subsetHpc$DateTime,subsetHpc$Sub_metering_2,type = "l",col="red")
lines(subsetHpc$DateTime,subsetHpc$Sub_metering_3,type="l",col="blue")

#Now the legend
legend("topright",
       col=c("black","red","blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Close the device
dev.off()
