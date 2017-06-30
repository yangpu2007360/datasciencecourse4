library("dplyr")

NEI <- readRDS("summarySCC_PM25.rds")


data<- filter(NEI, fips == "24510")

data<- filter(data, type == "ON-ROAD")

mn0 <- with(data,tapply(Emissions,year, sum ,na.rm=TRUE))

mn0<- as.data.frame(mn0)

year2<- c("1999", "2002", "2005", "2008")

plot(x=year2, y=mn0[,1], pch=20, ylab = "Emissions from vehicles in tons", xlab = "", main = "Baltimore vehicle Emissions from 1999 to 2008", type = "b", xaxt = 'n')

axis(1, at=year2, labels=c("1999", "2002", "2005","2008") )

dev.copy(png, file = "course4plot5.png", width= 480, height=480)

dev.off()