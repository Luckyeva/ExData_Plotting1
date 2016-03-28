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


## EDA plot 1

png("Plot1.png", width = 480, height = 480, units = "px")

hist(data2$Global_active_power, breaks = seq(0, 4000, by=260), xaxt = 'n',
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")
axis(1, at = c(0, 1000, 2000, 3000), labels = c(0, 2, 4, 6))

dev.off()
