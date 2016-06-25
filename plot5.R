#First download the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out motor vehicle emissions
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesNEI <- subset(vehiclesNEI, fips == 24510)

#plot
png("plot5.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) + theme_bw() +  guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore from 1999 to 2008"))

print(ggp)

dev.off()