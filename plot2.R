## plot2.R
## for Course Project 1 of Exploratory Data Analysis Course

## function plot2
## Call the function to produce a 480x480 png file named "plot2.png"
## as per assignment requirement

plot2 <- function () {
    
    library(graphics)
    
    consdata <- read.csv ("household_power_consumption.txt", sep=";", 
                          na.strings = "?", skip = 66636, nrows = 2880, header = TRUE)
    
    names (consdata) <- c("Date","Time","Global_active_power",
                          "Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    
    fdates <- 
        strptime (paste(consdata$Date,consdata$Time), 
                  format= "%d/%m/%Y %H:%M:%S")
    
    plot (fdates, consdata$Global_active_power, 
          ylab="Global Active Power (kilowatts)", xlab="", type="l")

    dev.copy (png, file = "plot2.png", width = 480, height = 480)
    dev.off()
    
}