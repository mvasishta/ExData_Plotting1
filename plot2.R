# load the library dplyr
library(dplyr)

#load the file to a data frame
hhpcdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)

#subset the data frame to take only required data
subset_hhpc <- subset(hhpcdata, Date == "1/2/2007" | Date == "2/2/2007")
hhpc_tbldf <- tbl_df(subset_hhpc)

# Do column datatype conversions
hhpc_tbldf$Global_active_power = as.numeric(hhpc_tbldf$Global_active_power)
hhpc_tbldf$Global_reactive_power = as.numeric(hhpc_tbldf$Global_reactive_power)
hhpc_tbldf$Voltage = as.numeric(hhpc_tbldf$Voltage)
hhpc_tbldf$Global_intensity = as.numeric(hhpc_tbldf$Global_intensity)
hhpc_tbldf$Sub_metering_1 = as.numeric(hhpc_tbldf$Sub_metering_1)
hhpc_tbldf$Sub_metering_2 = as.numeric(hhpc_tbldf$Sub_metering_2)
hhpc_tbldf$Sub_metering_3 = as.numeric(hhpc_tbldf$Sub_metering_3)

hhpc_tbldf$Date = as.Date(hhpc_tbldf$Date,"%d/%m/%Y")
hhpc_tbldf$Time = paste(hhpc_tbldf$Date,hhpc_tbldf$Time)

hhpc_tbldf$Time = as.POSIXct(hhpc_tbldf$Time)

#Plot Graph
plot(hhpc_tbldf$Time,hhpc_tbldf$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Save to PNG
dev.copy(png,"plot2.png")
dev.off()
