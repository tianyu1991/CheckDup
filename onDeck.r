data<-read.csv("OnDeck Analytics Asssignment.csv")

summary(data$days_delinquent_old)
data$AgeOld<-cut(as.numeric(data$days_delinquent_old),c(0,1,5,10,30,60,200),right=FALSE,labels=c(1:6))

summary(data$days_delinquent_new)
data$AgeNew<-cut(as.numeric(data$days_delinquent_new),c(0,1,5,10,30,60,200),right=FALSE,labels=c(1:6))

for( i in 1:6){
	subdata<-data[which(data$AgeOld==i),]
	sum = count(subdata, 'AgeNew')
	y<-paste("From",i,sep="")
	sum[,y]<-sum$freq/nrow(subdata)
	sum<-sum[,c(1,3)]
	
	if (i==1){
		result<-sum
	}
	else{
		result<-merge(result,sum,by="AgeNew",all=TRUE)
	}
}

result[is.na(result)] <- 0
