mykruskal<-function(x1,x2,...){
	z=list(x1,x2,...)
	grank = function(data1){
    alldata = sort(data1)
    tmpdf = data.frame(raw=alldata,  rank=1:length(alldata))
    avgrank = aggregate(tmpdf, by=list(tmpdf$raw),      FUN=mean)
    avgrank$Group.1=NULL
    #merge back
    samp1=data.frame(seq=1:length(data1), raw=data1)
    samp1=merge(samp1, avgrank)
    o1=order(samp1$seq)
    return(samp1$rank[o1])
	}
	number=length(z)
	for(i in 1:number){
		z[[i]]=na.omit(z[[i]])
	}
	alldata=NULL
	for(i in 1:number){
	alldata = sort(c(alldata,z[[i]]))
	}
	for(i in 1:number){
	tmpdf = data.frame(raw=alldata[[i]], rank=1:length(alldata[[i]]))
	avgrank = aggregate(tmpdf, by=list(tmpdf$raw), FUN=mean)
	avgrank$Group.1=NULL
	#merge back}
	T=NULL
	for(i in 1:number){
	samp1=data.frame(raw=z[[i]])
	samp1=merge(samp1, avgrank)
	T1=sum(samp1$rank)
	T=c(T,T1)
	}
	n1=length(z[[1]])
	k=number
	n=n1*k
	H=12/n/(n+1)*(sum(T^2)/n1)-3*(n+1)
	pvalue=1-pchisq(H,k-1)
	ans=list(H,n,pvalue,number)
	return(ans)

	}


	








	
}
