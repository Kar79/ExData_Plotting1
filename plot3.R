plot3 <- function() {
        
        cons <- read.table("household_power_consumption.txt", header=FALSE, sep= ";", nrows=2880, skip=66637, na.strings="?")
        
        cnames <- readLines("household_power_consumption.txt",1)
        
        cnames <- strsplit(cnames, ";", fixed=TRUE)
        
        colnames(cons) <- cnames[[1]]
        
        cons$Date = as.Date(cons$Date, "%d/%m/%Y")
        
        cons$Time = strptime(paste(cons$Date, cons$Time), "%Y-%m-%d %H:%M:%S")
        
        png(file="plot3.png")
        
        par(pch=".")
        
        plot(cons$Time,cons$Sub_metering_1,xlab="",ylab="Energy sub metering")
        
        lines(cons$Time,cons$Sub_metering_1)
        
        lines(cons$Time,cons$Sub_metering_2,col="red")
        
        lines(cons$Time,cons$Sub_metering_3,col="blue")
        
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
        
        dev.off()
        
}