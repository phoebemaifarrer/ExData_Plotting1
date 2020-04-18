# Peer-graded Assignment: Course Project 1
# By Phoebe Farrer
# 18-04-2020

rm(list = ls()) # clear global workspace

# Load in data ----

# I previously subsetted the larger data set for just dates 1/2/2007 & 2/2/2007 to make the txt data file smaller for ease of commiting.
# I did this with the below commented out steps.

#data <- read.table("household_power_consumption.txt", header = T, sep = ";", comment.char = "%", stringsAsFactors = F, na.strings = "?")
#data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data_subset <- read.table("household_power_consumption.txt", header = T, sep = ",", comment.char = "%", stringsAsFactors = F, na.strings = "?")
dim(data_subset) # checking I have loaded in the full data set
head(data_subset) # checking the format of the columns in the data set

# Format the data and time columns (for plot 2, 3, and 4) ----

data_subset$DateTimeStamp <- strptime(paste(data_subset$Date, data_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Plot 3 ----

plot3 <- function() {

with(data_subset, plot(DateTimeStamp, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
  
with(data_subset, lines(DateTimeStamp, Sub_metering_1, col = "black"))
with(data_subset, lines(DateTimeStamp, Sub_metering_2, col = "red"))
with(data_subset, lines(DateTimeStamp, Sub_metering_3, col = "blue"))
  
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_meeting_1", "Sub_meeting_2" , "Sub_meeting_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
  
dev.off()
}

plot3()