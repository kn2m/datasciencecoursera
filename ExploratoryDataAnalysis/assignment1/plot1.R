#get data if needed
power <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S") #convert to time class
power$Date <- as.Date(power$Date, "%d/%m/%Y") #convert to date class   
powersub <- subset(power, Date %in% as.Date(c("2007-02-01", "2007-02-02"))) #subset data
remove(power) 

#create plot 1
plot1 <- function(data=powersub) {
    #name file & set parameters
    png(file="plot1.png", width=480, height=480)
    hist(powersub$Global_active_power,
         col="red",
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    dev.off()
}

plot1()
