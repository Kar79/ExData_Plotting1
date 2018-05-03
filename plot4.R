plot4 <- function() {
        
        cons <- read.table("household_power_consumption.txt", header=FALSE, sep= ";", nrows=2880, skip=66637, na.strings="?")
        
        cnames <- readLines("household_power_consumption.txt",1)
        
        cnames <- strsplit(cnames, ";", fixed=TRUE)
        
        colnames(cons) <- cnames[[1]]
        
        cons$Date = as.Date(cons$Date, "%d/%m/%Y")
        
        cons$Time = strptime(paste(cons$Date, cons$Time), "%Y-%m-%d %H:%M:%S")
        
        png(file="plot4.png")
        
        par(mfrow=c(2,2))
        
        # First plot
        
        par(pch=".")
        
        plot(cons$Time,cons$Global_active_power,xlab="",ylab="Global Active Power")
        
        lines(cons$Time,cons$Global_active_power)
        
        # Second plot
        
        plot(cons$Time,cons$Voltage,xlab="datetime",ylab="Voltage")
        
        lines(cons$Time,cons$Voltage)      
        
        # Third plot
        
        plot(cons$Time,cons$Sub_metering_1,xlab="",ylab="Energy sub metering")
        
        lines(cons$Time,cons$Sub_metering_1)
        
        lines(cons$Time,cons$Sub_metering_2,col="red")
        
        lines(cons$Time,cons$Sub_metering_3,col="blue")
        
        legend("topright", inset=.02, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, box.lty=0)
        
        # Fourth plot
        
        plot(cons$Time,cons$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power")
        
        lines(cons$Time,cons$Global_reactive_power)
        
        dev.off()
        
}