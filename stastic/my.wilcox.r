my.wilcox<-function(data1,data2,alternative){
data1=data1[!is.na(data1)]
data2=data2[!is.na(data2)]
alldata = sort(c(data1,data2))
tmpdf = data.frame(raw=alldata, rank=1:length(alldata))
avgrank = aggregate(tmpdf, by=list(tmpdf$raw), FUN=mean)
avgrank$Group.1=NULL
samp1=data.frame(raw=data1)
samp1=merge(samp1, avgrank)
T=sum(samp1$rank)
n1=length(data1) 
n2=length(data2)
ET=n1*(n1+n2+1)/2 
SigmaT=sqrt(n1*n2*(n1+n2+1)/12)
z=(T-ET)/SigmaT
if(alternative=="less"){
	pvalue=pnorm(z)
}
else if(alternative=="two.sided"){
	pvalue=2*pnorm(z)
	if(pvalue>1){
		pvalue=(1-pnorm(z))*2
	}
}
else if(alternative=="greater"){
	pvalue=1-pnorm(z)
}
else{
	return (NULL)
}


ans=list(T,ET,SigmaT,n1,n2,z,pvalue)
return(ans)





}
