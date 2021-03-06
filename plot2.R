
# load dplyr package
library(dplyr) 

# getting data
dat <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

# creating truncated dataset by subsetting specified dates
data <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")

# removing dat from environment to free up RAM
rm(dat)

# converting date and time to proper formats
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")

# creating line plot across time of global active power
png(file = "plot2.png", width = 480, height = 480)
plot(x = data$Time, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
