## Loading Data into R

data <- read.table("/Users/lucky1eva/Downloads/household_power_consumption.txt", sep = ';')

namevar <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
             "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

colnames(data) <- namevar

data$Date <- as.Date(data$Date, "%d/%m/%Y")

library(dplyr)
df <- select(data, Global_active_power:Sub_metering_3)
df2 <- lapply(df, as.numeric)
df3 <- cbind(data[, 1:2], df2)
data2 <- filter(df3, Date == "2007-02-01" | Date == "2007-02-02")


## EDA plot 4

png("Plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

### Topleft Plot
plot(data2$Global_active_power, type = 'l', xaxt = 'n',
     ylab = "Global Active Power (kilowatts)", xlab = "Date")
axis(1, at = c(0, 1450, 2900), labels = c("Thur", "Fri", "Sat"))

### Topright Plot
plot(data2$Voltage, type = 'l', xaxt = 'n',
     ylab = "Voltage", xlab = "datetime")
axis(1, at = c(0, 1450, 2900), labels = c("Thur", "Fri", "Sat"))

### Bottomleft Plot
plot(data2$Sub_metering_3, type = 'l', col = 'blue', ylab = "Energy sub metering",
     xaxt = "n")
lines(data2$Sub_metering_1, col = 'black')
lines(data2$Sub_metering_2, col = "red")
axis(1, at = c(0, 1450, 2900), labels = c("Thur", "Fri", "Sat"))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue") )

### Bottomright Plot
plot(data2$Global_reactive_power, type = 'l', xaxt = 'n',
     ylab = "Global reactive power", xlab = "datetime")
axis(1, at = c(0, 1450, 2900), labels = c("Thur", "Fri", "Sat"))

dev.off()

