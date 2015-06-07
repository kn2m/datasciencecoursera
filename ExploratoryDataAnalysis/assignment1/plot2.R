#get data if needed
power <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S") #convert to time class
power$Date <- as.Date(power$Date, "%d/%m/%Y") #convert to date class   
powersub <- subset(power, Date %in% as.Date(c("2007-02-01", "2007-02-02"))) #subset data
remove(power) 

#create plot 2
plot2 <- function(data=powersub) {
    #name file & set parameters
    png(file="plot2.png", width=480, height=480)
    #create plot
    plot(powersub$Time, powersub$Global_active_power,
         type="l",
         ylab="Global ActivePower (kilowatts)",
         xlab="")
    dev.off()
}

plot2()
