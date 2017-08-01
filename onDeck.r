summary(data$days_delinquent_old)
data$AgeOld<-cut(as.numeric(data$days_delinquent_old),c(0,1,5,10,30,60,200),right=FALSE,labels=c(1:6))

summary(data$days_delinquent_new)
data$AgeNew<-cut(as.numeric(data$days_delinquent_new),c(0,1,5,10,30,60,200),right=FALSE,labels=c(1:6))

