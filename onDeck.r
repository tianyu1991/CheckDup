data<-read.csv("OnDeck Analytics Asssignment.csv")

summary(data$days_delinquent_old)
data$AgeOld<-cut(as.numeric(data$days_delinquent_old),c(0,1,5,10,30,60,200),right=FALSE,labels=c(1:6))

summary(data$days_delinquent_new)
data$AgeNew<-cut(as.numeric(data$days_delinquent_new),c(0,1,5,10,30,60,200),right=FALSE,labels=c(1:6))

test<-data[which(data$AgeOld=='2'),]
library(plyr)
y = count(test, 'AgeNew')
y$p<-y$freq/nrow(test)

test2<-data[which(data$AgeOld=='3'),]
y2 = count(test2, 'AgeNew')
y2$p<-y2$freq/nrow(test)

test3<-merge(y,y2,by="AgeNew")

for( i in 1:6){
	subdata<-data[which(data$AgeOld==i),]
	r = count(subdata, 'AgeNew')
	y<-paste("From",i,sep="")
	r[,y]<-r$freq/nrow(subdata)
	r<-r[,c(1,3)]
	
	if (i==1){
		result<-r
	}
	else{
		result<-merge(result,r,by="AgeNew",all=TRUE)
	}
}

result[is.na(result)] <- 0

aggregate(new_outstanding_principal_balance ~ AgeNew, subdata,FUN=sum)


