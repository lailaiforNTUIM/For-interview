my.ftest<-function(x1,x2,alternative){
	x1=x1[!is.na(x1)]
	x2=x2[!is.na(x2)]
	var1=var(x1)
	var2=var(x2)
	fvalue=var1/var2
	n1=length(x1)
	n2=length(x2)
	if(alternative=="two.sided"){
		pvalue=pf(fvalue,n1-1,n2-1)
		if(pvalue>0.5){
		pvalue=1-pf(fvalue,n1-1,n2-1)
		}
		pvalue=pvalue*2
	}
	else if(alternative=="greater"){
		pvalue=1-pf(fvalue,n1-1,n2-1)
	}
	else if(alternative=="less"){
		pvalue=pf(fvalue,n1-1,n2-1)
	}
	else{
	return(NULL)
	}
	list1=list(fvalue,pvalue,n1,n2)
	return(list1)






}

