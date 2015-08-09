## plot1.R
## for Course Project 1 of Exploratory Data Analysis Course

## function plot1
## Call the function to produce a 480x480 png file named "plot1.png"
## as per assignment requirement

plot1 <- function () {

library(graphics)
    
consdata <- read.csv ("household_power_consumption.txt", sep=";", 
        na.strings = "?", skip = 66636, nrows = 2880, header = TRUE)

names (consdata) <- c("Date","Time","Global_active_power",
                      "Global_reactive_power","Voltage","Global_intensity",
                      "Sub_metering_1","Sub_metering_2","Sub_metering_3")

hist (consdata$Global_active_power, xlab = "Global Active Power (kilowatts)", 
      main = "Global Active Power", col = "red")

dev.copy (png, file = "plot1.png", width = 480, height = 480)
dev.off()

}