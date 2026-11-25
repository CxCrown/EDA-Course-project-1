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
png("./EDA 1/plot2.png", width = 480, height = 480)

#Plots the figure, removing the xaxis label with xaxt="n"
plot(df$DateTime, df$Global_active_power, type="l", xaxt="n", ylab = "Global Active Power (kilowatts)", xlab="")
#Renaming the xaxis with labels Thu, Fri, Sat based on start of day and end of day for each date and time in the dateTime variable
axis(1,
     at = as.POSIXct(c("2007-02-01 00:00:00",
                       "2007-02-02 00:00:00",
                       "2007-02-02 23:59:00")),
     labels = c("Thu", "Fri", "Sat"))

dev.off()
