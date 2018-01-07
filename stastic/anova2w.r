anova.2w<-function(df1,alpha=0.05){
	blocknum=nrow(df1)
	treatnum=ncol(df1)
	bsum<-NULL
	bmean<-NULL
	bvar<-NULL
	nsum<-NULL
	nmean<-NULL
	nvar<-NULL
	for(i in 1:treatnum){
		temp<-df1[,i]            
		temp<-temp[!is.na(temp)]
		nsum<-c(nsum,sum(temp))
		nmean<-c(nmean,mean(temp))
		nvar<-c(nvar,var(temp))
	}
	for(i in 1:blocknum){
		temp<-df1[i,]
		temp<-temp[!is.na(temp)]
		bsum<-c(bsum,sum(temp))
		bmean<-c(bmean,mean(temp))
		bvar<-c(bvar,var(temp))
	
	}
		grandmean=sum(nsum)/(blocknum*treatnum)
		sst=sum(blocknum*(nmean-grandmean)^2)
		ssb=sum(treatnum*(bmean-grandmean)^2)
		df_t=treatnum-1
		df_b=blocknum-1
		mst=sst/df_t
		msb=ssb/df_b
		sse=0
		for( i in 1:blocknum){
			for(j in 1 :treatnum){
				sse=sse+(df1[i,j]-nmean[j]-bmean[i]+grandmean)^2
			
			
			}
		}
		
		
		df_e=blocknum*treatnum -blocknum-treatnum+1
		mse=sse/df_e
		fvaluet=mst/mse
		fvalueb=msb/mse
		pvaluet=1-pf(fvaluet,df_t,df_e)
		pvalueb=1-pf(fvalueb,df_b,df_e)
		t_Fcrit=qf(1-alpha,df_t,df_e)
		b_Fcrit=qf(1-alpha,df_b,df_e)
		
		ans <- matrix(c(sst,ssb,sse,df_t,df_b,df_e,mst,msb,mse,fvaluet,fvalueb,NA,pvaluet,pvalueb,NA,t_Fcrit,b_Fcrit,NA), nrow = 3, ncol = 6,
               dimnames = list(c("Treatments", "Blocks" , "Error"),
            c("SS", "df", "MS","F","pvalue","F-crit")))	
		return(ans)



}
