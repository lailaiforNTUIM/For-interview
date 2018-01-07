setwd("C:\\Users\\賴柏霖\\Desktop\\統計")
statxsl="Stat_2016_HW_09_sampling.xlsx"
data<- loadWorkbook(statxsl)
df1 <- readWorksheet(data,1)
df1veg<-df1[,4]
meanforveg<-mean(df1veg)#n-1#第一題,mean
varforveg <- var(df1veg)#n-1#第一題,adjusted variance
varforveg1<-varforveg*(23999)/24000  #第一題,population variance
cat("mean =",meanforveg,"\n")
cat("population variance =",varforveg1,"\n")
cat("adjusted population variance =",varforveg,"\n")   #第一題end

set.seed(32535)
vegforsample<-sample(df1veg,240)
meanforsample<-mean(vegforsample)#第二題
varforsample<-var(vegforsample)#第二題
cat("the sample mean is",meanforsample,"\n")
cat("the sample variance is",varforsample,"\n")  #第二題end


sampleerror<-abs(varforsample-varforveg)   #跟adjust的誤差
sampleerror1<-abs(varforsample-varforveg1)#跟pop的誤差
meanforsampleerror<-abs(meanforsample-meanforveg)
cat("sampleing誤差為",sampleerror,"\n")
cat("sampleing誤差為",sampleerror1,"\n")
cat("sampleing誤差為",meanforsampleerror,"\n")
if(sampleerror>sampleerror1){
	cat("比較靠近 population variance \n")
}else{
	cat("比較靠近 adjusted variance \n")
}                                     #第三題end
set.seed(1118)
rmse_all_mean <- vector(mode="numeric",length=1000)
rmse_all_meanforp <- vector(mode="numeric",length=1000)
rmse_all_meanforad<- vector(mode="numeric",length=1000)        #開三個1000陣列
for(i in 1:1000){
vfs<-sample(df1veg,240)
meanforvfs<-mean(vfs)
varforvfs <-var(vfs)
rmse_mean<-(meanforveg-meanforvfs)^2
rmse_all_mean[i]<-rmse_mean
rmse_varwithad<-(varforveg-varforvfs)^2
rmse_all_meanforad[i]<-rmse_varwithad
rmse_varwhitp<-(varforveg1-varforvfs)^2
rmse_all_meanforp[i]<-rmse_varwhitp


}
ansmean=0
ansvarad=0
ansvarp=0
for(i in 1:1000){
ansmean<-ansmean+rmse_all_mean[i]
ansvarad<-ansvarad+rmse_all_meanforad[i]
ansvarp<-ansvarp+rmse_all_meanforp[i]
}
ansmean<-(ansmean/1000)^(1/2)
ansvarad<-(ansvarad/1000)^(1/2)
ansvarp<-(ansvarp/1000)^(1/2)
cat("RMSE for mean=",ansmean,"\n")
cat("RMSE for variance with adjusted variance =",ansvarad,"\n")
cat("RMSE for variance with population variance =",ansvarp,"\n")  #第四題










