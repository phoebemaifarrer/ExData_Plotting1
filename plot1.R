# Peer-graded Assignment: Course Project 1
# By Phoebe Farrer
# 18-04-2020

rm(list = ls()) # clear global workspace

# Set working directory to read in data set (this will need to be changed for different computers/users) ----

setwd("Z:/Credit Benchmark/Data/Phoebe/Archive/Exploratory Data Analysis")

# Load in data ----

data <- read.table("household_power_consumption.txt", header = T, sep = ";", comment.char = "%", stringsAsFactors = F, na.strings = "?")
dim(data) # checking I have loaded in the full data set
head(data) # checking the format of the columns in the data set

# Subset the data set to only be the interest dats i.e. 2007-02-01 and 2007-02-02 ----

data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Format the data and time columns (for plot 2, 3, and 4) ----

data_subset$DateTimeStamp <- strptime(paste(data_subset$Date, data_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Plot 1 ----

plot1 <- function() {
  
hist(data_subset$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()
}

plot1()

# plot1.png will be saved in setwd() location
