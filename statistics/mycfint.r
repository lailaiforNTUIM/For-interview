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
