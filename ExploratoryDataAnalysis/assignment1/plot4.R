#get data if needed
power <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S") #convert to time class
power$Date <- as.Date(power$Date, "%d/%m/%Y") #convert to date class   
powersub <- subset(power, Date %in% as.Date(c("2007-02-01", "2007-02-02"))) #subset data
remove(power) 

#create plot 4
plot4 <- function(data=powersub) {
    #name file & set parameters
    png(file="plot4.png", width=480, height=480)
    par(mfrow=c(2,2))
    
    #create plot 1
    plot(powersub$Time, powersub$Global_active_power,
         type="l",
         ylab="Global ActivePower",
         xlab="")
    
    #create plot 2
    plot(powersub$Time, powersub$Voltage,
         type="l", xlab="datetime", ylab="Voltage")
    
    #create plot 3
    plot(powersub$Time, powersub$Sub_metering_1,
         type="l", col="black", ylab="Energy sub metering", xlab="")
    lines(powersub$Time, powersub$Sub_metering_2,
          col="red")
    lines(powersub$Time, powersub$Sub_metering_3,
          col="blue")
    legend("topright", col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lty=0)
    
    #create plot 4
    plot(powersub$Time, powersub$Global_reactive_power,
         type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.off()
}

plot4()
