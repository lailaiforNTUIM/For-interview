mycfint<-function(avec,alpha=0.05,psigma=0){
if(psigma<0|alpha<=0|alpha>=1){ 
	a=NULL 
	return(a) 
}
else{
if(psigma>0){
	x<-mean(avec)
	z<-qnorm(1-alpha/2)
	n<-length(avec)
	lcl<-x-(z*psigma/(n^(1/2)))
	ucl<-x+(z*psigma/(n^(1/2)))
	ans<-c(lcl,ucl)
	return(ans)
}
else{
	x<-mean(avec)
	n<-length(avec)
	std<-sd(avec)
	z<-qnorm(1-alpha/2)
	lcl<-x-(z*std/(n^(1/2)))
	ucl<-x+(z*std/(n^(1/2)))
	ans<-c(lcl,ucl)
	return(ans)

}


}
}
setwd(C:\\Users\\賴柏霖\\Desktop)
name="Xr10-35.xlsx"
book=loadWorkbook(name)
ans= readWorksheet(book,1)
a=ans[,1]
outputfor35=mycfint(a,,1.3)   #10.35答案
cat("10.35答案是",outputfor35,"\n")
name="Xr10-39.xlsx"
book=loadWorkbook(name)
ans= readWorksheet(book,1)
a=ans[,1]
outputfor39=mycfint(a,0.1,3)  #10.39答案
cat("10.39答案是",outputfor39,"\n")