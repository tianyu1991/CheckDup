library("openxlsx")
mydf <- read.xlsx("FY17Q4 Data Clean.xlsx", sheet = 1, startRow = 1, colNames = TRUE)
SuperS <- read.xlsx("UPD 2017 Super Saturday  - HCZ Report.xlsx", sheet = 1, startRow = 1, colNames = TRUE)


FullName<-paste(mydf[,2],mydf[,3],sep=" ")
mydf<-cbind(mydf,tolower(FullName))
newdata<-mydf[order(FullName),]

newdata[] <- lapply(newdata, as.character)

SuperS_Count<-rep(0,nrow(newdata))
newdata<-cbind(newdata,SuperS_Count)

FullName<-paste(SuperS[,1],SuperS[,2],sep=" ")
SuperS<-cbind(SuperS,tolower(FullName))
SuperS<-SuperS[order(FullName),]

SuperS[] <- lapply(SuperS, as.character)

for(i in 1:nrow(newdata)){
		for(n in 1:nrow(SuperS)){
			if (newdata[i,52]==SuperS[n,13]){
					newdata[i,53]=newdata[i,53]+1
				}
			
		}
}

Sys.setenv(R_ZIPCMD= "C:/Rtools/bin/zip")

write.xlsx(x=newdata, file = "data0728.xlsx",
        sheetName = "Test", row.names = FALSE)

write.xlsx(x=SuperS, file = "SuperS0728.xlsx",
        sheetName = "Test", row.names = FALSE)
