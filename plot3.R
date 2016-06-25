#First download the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out data for Baltimore
baltimore <- subset(NEI, fips == "24510")
totalbaltimore <- aggregate(Emissions ~ year, baltimore, sum)

#plot
library(ggplot2)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(baltimore,aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE)+ facet_grid(.~type,scales = "free",space="free") + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()
