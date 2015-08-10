## plot3.R
## for Course Project 1 of Exploratory Data Analysis Course

## function plot3
## Call the function to produce a 480x480 png file named "plot3.png"
## as per assignment requirement

plot3 <- function () {
    
    library(graphics)
    
    consdata <- read.csv ("household_power_consumption.txt", sep=";", 
                          na.strings = "?", skip = 66636, nrows = 2880, header = TRUE)
    
    names (consdata) <- c("Date","Time","Global_active_power",
                          "Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    
    fdates <- 
        strptime (paste(consdata$Date,consdata$Time), 
                  format= "%d/%m/%Y %H:%M:%S")
    
    plot (fdates, consdata$Sub_metering_1, 
          ylab="Energy sub metering", xlab="", type="l")
    lines (fdates, consdata$Sub_metering_2, col ="red")
    lines (fdates, consdata$Sub_metering_3, col ="blue")
    legend ("topright", legend = c("Sub_metering_1","Sub_metering_2", 
                                   "Sub_metering_3"),
                        col=c("black","red","blue"), lty = c(1, 1, 1), 
                        lwd = c (1,1,1))

    dev.copy (png, file = "plot3.png", width = 480, height = 480)
    dev.off()
    
}