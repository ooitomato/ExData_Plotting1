#download file
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = 'household_power_consumption.zip')
unzip('household_power_consumption.zip')

#read data from file
target <- file('household_power_consumption.txt')
data <- read.table(text = grep("^[1.2]/2/2007", readLines(target), value = TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", na.strings = '?'))

# convert data and time to specific format
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
# start plotting
png(filename = './plot2.png', width = 480, height = 480, units='px')
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()
