# set working directory from which to read in txt file
setwd('C:\\Users\\mommabear\\Desktop\\Coursera\\Exploratory Data Analysis\\Course Project 1')

# read in txt file
power_dat <- read.csv('household_power_consumption.txt',sep=';',na.strings = '?')

# combine Date and Time variables into single variable
x <- paste(power_dat$Date, power_dat$Time)
power_dat$DateTime <- strptime(x,"%d/%m/%Y %H:%M:%S")

# subset dataset to between 2/1/2007 and 2/2/2007
power_dat2 <- subset(power_dat, power_dat$DateTime >= "2007-02-01 00:00:00"
       & power_dat$DateTime <= "2007-02-02 23:59:59")

rm("power_dat","x")

# create histogram
png(filename="plot1.png",width=480,height = 480)
hist(power_dat2$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()