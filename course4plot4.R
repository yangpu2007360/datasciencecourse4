library("dplyr")
library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

good<- grep('Coal', SCC$Short.Name)

coal<-SCC[good,]

coal<-filter(NEI,NEI$SCC == coal$SCC)

mn0 <- with(coal,tapply(Emissions,year, sum ,na.rm=TRUE))

mn0<- as.data.frame(mn0)

year2<- c("1999", "2002", "2005", "2008")

plot(x=year2, y=mn0[,1], pch=20, ylab="Total PM2.5 Emission in tons", xlab = "", type = "b", lwd = 2, xaxt = 'n', main="Emission of PM(2.5) per year of Coal Combustors")




axis(1, at = year2, labels = c("1999","2002", "2005", "2008"))

dev.copy(png, file = "course4plot4.png", width= 480, height=480)

dev.off()