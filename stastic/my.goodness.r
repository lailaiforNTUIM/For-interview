my.goodness<-function(actual,prob1,nobs,alpha=0.05){
	enobs = nobs * prob1
	df1 = length(prob1)-1
	if(sum(enobs <5) > 0) {
    cat("Rule of Five not meet.\n")
} else {
    tmp1 = (actual - enobs)^2 / enobs
    chi2= sum(tmp1)
    cat("Chi2 Stat.=", chi2, "\n")
    chi2_cv = qchisq(1-alpha, df1)
    cat("Critical value=", chi2_cv, "\n")
    pvalue = 1-pchisq(chi2, df1)
    cat("p-value=", pvalue, "\n")
}







}