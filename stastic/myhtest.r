myhtest<-function(samp1,h0mean,htype,alpha=0.05,psigma=0){
no=0
if(psigma<0|alpha<=0|alpha>=1){ 
	a=NULL 
	return(a) 
}
if(htype=="lefttail"){
	if(psigma>0){
		mean1<-mean(samp1)
		z=(mean1-h0mean)/(psigma/(length(samp1)^(1/2)))
		pvalue<-pnorm(z)
		zor<-qnorm(1-alpha)
		reject=(z<=-zor)
		ans<-c(pvalue,z,reject)
		return(ans)
	}
	if(psigma==0){
		mean1<-mean(samp1)
		std=sd(samp1)
		z=(mean1-h0mean)/(std/(length(samp1)^(1/2)))
		pvalue<-pnorm(z)
		zor<-qnorm(1-alpha)
		reject=(z<=-zor)
		ans<-c(pvalue,z,reject)

		return(ans)
	}
}
if(htype=="righttail"){
	if(psigma>0){
		mean1<-mean(samp1)
		z=(mean1-h0mean)/(psigma/(length(samp1)^(1/2)))
		pvalue<-1-pnorm(z)
		zor<-qnorm(1-alpha)
		reject=(z>=zor)
		ans<-c(pvalue,z,reject)
		return(ans)
	}
	if(psigma==0){
		mean1<-mean(samp1)
		std=sd(samp1)
		z=(mean1-h0mean)/(std/(length(samp1)^(1/2)))
		pvalue<-1-pnorm(z)
		zor<-qnorm(1-alpha)
		reject<-(z>=zor)
		ans<-c(pvalue,z,reject)
		return(ans)
	}
}
	if(htype=="twotail"){
		if(psigma>0){
			mean1<-mean(samp1)
			z=(mean1-h0mean)/(psigma/(length(samp1)^(1/2)))
			pvalue<-pnorm(z)*2
			pvalue1<-(1-pnorm(z))*2
			if(pvalue>pvalue1) 
				pvalue=pvalue1
			zor<-qnorm(1-(alpha/2))
			reject=(z>=zor)
			reject1=(z<=-zor)
			ans<-c(pvalue,z,reject|reject1)
			return(ans)
	}
	if(psigma==0){
		mean1<-mean(samp1)
		std=sd(samp1)
		z=(mean1-h0mean)/(std/(length(samp1)^(1/2)))
		pvalue<-pnorm(z)*2
		pvalue1<-(1-pnorm(z))*2
		if(pvalue>pvalue1)
		pvalue=pvalue1
		zor<-qnorm(1-(alpha/2))
		reject<-(z<=-zor)
		reject1<-(z>=zor)
		ans<-c(pvalue,z,reject|reject1)
		return(ans)
	}
	}
	if(no==0){
	a=NULL;
	return(a)
	}












}
