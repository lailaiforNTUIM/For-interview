anova.1w<-function(x1,x2,...){
	z=list(x1,x2,...)
	number=length(z)
	eachsum<-NULL
	eachlen<-NULL
	eachmean<-NULL
	eachvar<-NULL
	for(i in 1:number){
		temp<-z[[i]]
		temp<-temp[!is.na(temp)]
		eachsum<-c(eachsum,sum(temp))
		eachlen<-c(eachlen,length(temp))
		eachmean<-c(eachmean,mean(temp))
		eachvar<-c(eachvar,var(temp))
	}
		grandmean=sum(eachsum)/sum(eachlen)
		sst=sum(eachlen*(eachmean-grandmean)^2)
		df_t=number-1
		mst=sst/df_t
		sse=sum(eachvar*(eachlen-1))
		df_e=sum(eachlen)-number
		mse=sse/df_e
		fvalue=mst/mse
		pvalue=1-pf(fvalue,df_t,df_e)
		ans<-data.frame(sst,df_t,mst,sse,df_e,mse,fvalue,pvalue)
		return(ans)



}
