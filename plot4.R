## plot4.R
## for Course Project 1 of Exploratory Data Analysis Course

## function plot4
## Call the function to produce a 480x480 png file named "plot4.png"
## as per assignment requirement

plot4 <- function () {
    
    library(graphics)
    
    consdata <- read.csv ("household_power_consumption.txt", sep=";", 
                          na.strings = "?", skip = 66636, nrows = 2880, header = TRUE)
    
    names (consdata) <- c("Date","Time","Global_active_power",
                          "Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    
    fdates <- 
        strptime (paste(consdata$Date,consdata$Time), 
                  format= "%d/%m/%Y %H:%M:%S")
    
    par (mfrow = c(2,2))
    par (xpd = FALSE)
    
    plot (fdates, consdata$Global_active_power, 
          ylab="Global Active Power", xlab="", type="l")
    
    
    plot (fdates, consdata$Voltage, 
          ylab="Voltage", xlab="datetime", type="l")
    
    plot (fdates, consdata$Sub_metering_1, 
          ylab="Energy sub metering", xlab="", type="l")
    lines (fdates, consdata$Sub_metering_2, col ="red")
    lines (fdates, consdata$Sub_metering_3, col ="blue")
    legend ("top", legend = c("Sub_metering_1","Sub_metering_2", 
                                   "Sub_metering_3"),
            col=c("black","red","blue"), lty = c(1, 1, 1), 
            lwd = c (1,1,1), bty="n", cex=0.7 )
 
    plot (fdates, consdata$Global_reactive_power, 
          ylab="Global_reactive_power", xlab="datetime", type="l")
    
    dev.copy (png, file = "plot4.png", width = 480, height = 480)
    dev.off()
    
}