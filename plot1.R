#First download the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate the data by year
total <- aggregate(Emissions ~ year, NEI, sum)

#Plot the data

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot((total$Emissions)/10^6, names.arg=total$year, xlab = "Year", ylab = "PM2.5 Emissions", main = "PM2.5 Emissions From US Sources")

dev.off()