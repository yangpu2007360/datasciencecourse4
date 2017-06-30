library("dplyr")

NEI <- readRDS("summarySCC_PM25.rds")


data<- filter(NEI, fips == "24510")
data2<- filter(NEI, fips == "06037")


data<- filter(data, type == "ON-ROAD")
data2<- filter(data2, type == "ON-ROAD")


mn0 <- with(data,tapply(Emissions,year, sum ,na.rm=TRUE))
mn1 <- with(data2,tapply(Emissions,year, sum ,na.rm=TRUE))


mn0<- as.data.frame(mn0)
mn1<- as.data.frame(mn1)


year2<- c("1999", "2002", "2005", "2008")

par(mfrow=c(1,2))


plot(x=year2, y=mn0[,1], pch=20, ylab = "Emissions from vehicles in tons, Baltimore", xlab = "", type = "b", xaxt = 'n')
 
axis(1, at=year2, labels=c("1999", "2002", "2005","2008") )


plot(x=year2, y=mn1[,1], pch=20, ylab = "Emissions from vehicles in tons, Los Angeles", xlab = "", type = "b", xaxt = 'n')

axis(1, at=year2, labels=c("1999", "2002", "2005","2008") )

dev.copy(png, file = "course4plot6.png", width= 480, height=480)

dev.off()