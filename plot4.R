#First download the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out combustion and coal data
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalcombustion <- (combustion & coal)
combustionSCC <- SCC[coalcombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

#plot
png("plot4.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) + geom_bar(stat="identity",fill="grey",width=0.75) + theme_bw() +  guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)

dev.off()
