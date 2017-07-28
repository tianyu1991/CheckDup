library("openxlsx")
mydf <- read.xlsx("FY17Q4 Data Clean.xlsx", sheet = 1, startRow = 1, colNames = TRUE)
SuperS <- read.xlsx("UPD 2017 Super Saturday  - HCZ Report.xlsx", sheet = 1, startRow = 1, colNames = TRUE)

rdf<-nrow(mydf)
FullName<-paste(mydf[,2],mydf[,3],sep=" ")
mydf2<-cbind(mydf,FullName)
newdata<-mydf2[order(FullName),]

FullName<-paste(SuperS[,1],SuperS[,2],sep=" ")
SuperS2<-cbind(SuperS,FullName)
SuperS2<-SuperS2[order(FullName),]

SuperS_Count<-rep(0,nrow(newdata))
newdata<-cbind(newdata,SuperS_Count)

