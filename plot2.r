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


## EDA plot 2

png("Plot2.png", width = 480, height = 480, units = "px")

plot(data2$Global_active_power, type = 'l', xaxt = 'n',
     ylab = "Global Active Power (kilowatts)", xlab = "Date")
axis(1, at = c(0, 1450, 2900), labels = c("Thur", "Fri", "Sat"))

dev.off()