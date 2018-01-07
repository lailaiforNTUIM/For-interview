mysrcor<-function(data1,data2,alternative=two.sided){
	if(length(data1)!=length(na.omit(data1)))
	return NULL
	if(length(data2)!=length(na.omit(data2)))
	return NULL
	if(length(data1)!=length(data2))
	return NULL
	tsab=sum(data1*data2)
	tsab1=sum(data1)*sum(data2)/length(data1)
	sab=(tsab-tsab1)/(length(data1)-1)
	tsa=sum(data1*data1)
	tsa1=(sum(data1))^2/length(data1)
	sa=(tsa-tsa1)/(length(data1)-1)
	tsb=sum(data2*data2)
	tsb1=(sum(data2))^2/length(data2)
	sb=(tsb-tsb1)/(length(data2)-1)
	c1=sab/(sa*sb)
	#cat("Spearman Correlation Coef=", c1, "\n")
	sigma1 = sqrt(1/(length(data2)-1))
	zvalue = c1/sigma1
#	cat("zvalue=", zvalue, "\n")
	if(alternative=="two.sided"){
		pvalue = (1-pnorm(zvalue))*2
		if(pvalue>1){
		pvalue=pnorm(zvalue)*2
		}
	}
	else if(alternative=="less"){
		pvalue=pnorm(zvalue)
	}
	else if(alternative=="greater"){
		pvalue=1-pnorm(zvalue)
	}
	else{
	return NULL}
	ans=list(c1,zvalue,pvalue)
	return(ans)
#	cat("pvalue=", pvalue, "\n")
}

