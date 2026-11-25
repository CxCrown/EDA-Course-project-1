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

#Save the figure in a png-format
png("./EDA 1/plot1.png", width = 480, height = 480)
#Creating the histogram
hist(df$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

