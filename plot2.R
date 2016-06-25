#First download the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out data for Baltimore
baltimore <- subset(NEI, fips == "24510")
totalbaltimore <- aggregate(Emissions ~ year, baltimore, sum)

#Plot

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(totalbaltimore$Emissions, names.arg=totalbaltimore$year, xlab = "Year", ylab = "Baltimore PM2.5 Emissions", main = "PM2.5 Emissions From Baltimore")

dev.off()