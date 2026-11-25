#Loading in the data
df <- read.csv("./EDA 1/exdata_data_household_power_consumption/household_power_consumption.txt", 
               sep = ";", 
               stringsAsFactors = F,
               na.strings = "?")

#Converting the dates to the date format instead of strings
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#Filtering between 2007-02-01 and 2007-02-02
df <- df[df$Date >= as.Date("2007-02-01") & 
           df$Date <= as.Date("2007-02-02"), ]

#Making a new variable DateTime with both dates and the time
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

#Save the figure in a png-format
png("./EDA 1/plot4.png", width = 480, height = 480)

# 2 rows and two colums of figures
par(mfrow = c(2, 2))
#Figure taken from Plot 2
plot(df$DateTime, df$Global_active_power, type="l", xaxt="n", ylab = "Global Active Power (kilowatts)", xlab="")
#Renaming the xaxis with labels Thu, Fri, Sat based on start of day and end of day for each date and time in the dateTime variable
axis(1,
     at = as.POSIXct(c("2007-02-01 00:00:00",
                       "2007-02-02 00:00:00",
                       "2007-02-02 23:59:00")),
     labels = c("Thu", "Fri", "Sat"))

# Voltage dateTime figure
plot(df$DateTime, df$Voltage, type="l", xaxt="n", ylab = "Voltage", xlab="dateTime")
axis(1,
     at = as.POSIXct(c("2007-02-01 00:00:00",
                       "2007-02-02 00:00:00",
                       "2007-02-02 23:59:00")),
     labels = c("Thu", "Fri", "Sat"))

#Figure taken from Plot 3
plot(df$DateTime, df$Sub_metering_1, type="l", xaxt="n", ylab = "Energy sub metering", xlab="")
lines(df$DateTime, df$Sub_metering_2, col="red") #adds lines for the sub_metering_2
lines(df$DateTime, df$Sub_metering_3, col="blue") #adds lines for the sub_metering_3
#Renaming the xaxis with labels Thu, Fri, Sat based on start of day and end of day for each date and time in the dateTime variable
axis(1,
     at = as.POSIXct(c("2007-02-01 00:00:00",
                       "2007-02-02 00:00:00",
                       "2007-02-02 23:59:00")),
     labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_meterin_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))

#Global reactive power and dateTime figure
plot(df$DateTime, df$Global_reactive_power, type="l", xaxt="n", ylab = "Global_reactive_power", xlab="dateTime")
axis(1,
     at = as.POSIXct(c("2007-02-01 00:00:00",
                       "2007-02-02 00:00:00",
                       "2007-02-02 23:59:00")),
     labels = c("Thu", "Fri", "Sat"))

dev.off()
