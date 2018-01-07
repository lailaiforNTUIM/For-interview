mygoodfit<-function(actual,prob1){
	if(length(actual)!=length(prob1)){
		return (NULL)
	}
	if(length(actual)!=length(na.omit(actual))){
	return (NULL)}
	if(length(prob1)!=length(na.omit(prob1))){
	return (NULL)}
	
	nobs=sum(actual)
	enobs = nobs * prob1
	df1 = length(prob1)-1
	if(sum(enobs <5) > 0) {
    return (NULL)
	} 
	else {
    tmp1 = (actual - enobs)^2 / enobs
    chi2= sum(tmp1)
  #  cat("Chi2 Stat.=", chi2, "\n")

   # cat("Critical value=", chi2_cv, "\n")
    pvalue = 1-pchisq(chi2, df1)
	if(pvalue>1)
	pvalue=pchisq(chi2,df1)
    #cat("p-value=", pvalue, "\n")
	ans=list(chi2,pvalue)
	return(ans)

}








}
