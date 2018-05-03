plot2 <- function() {
        
        cons <- read.table("household_power_consumption.txt", header=FALSE, sep= ";", nrows=2880, skip=66637, na.strings="?")
        
        cnames <- readLines("household_power_consumption.txt",1)
        
        cnames <- strsplit(cnames, ";", fixed=TRUE)
        
        colnames(cons) <- cnames[[1]]
        
        cons$Date = as.Date(cons$Date, "%d/%m/%Y")
        
        cons$Time = strptime(paste(cons$Date, cons$Time), "%Y-%m-%d %H:%M:%S")
        
        png(file="plot2.png")
        
        par(pch=".")
        
        plot(cons$Time,cons$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)")
        
        lines(cons$Time,cons$Global_active_power)
        
        dev.off()
        
}