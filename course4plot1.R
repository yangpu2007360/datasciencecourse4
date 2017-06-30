NEI <- readRDS("summarySCC_PM25.rds")

year<- as.factor(NEI$year)

mn0 <- with(NEI,tapply(Emissions,year, sum ,na.rm=TRUE))

mn0<- as.data.frame(mn0)

year2<- c("1999", "2002", "2005", "2008")

plot(x=year2, y=mn0[,1], pch=20, ylab="Total PM2.5 Emission in tons", xlab = "", type = "b", lwd = 2, xaxt = 'n')

axis(1, at = year2, labels = c("1999","2002", "2005", "2008"))

dev.copy(png, file = "course4plot1.png", width= 480, height=480)

dev.off()