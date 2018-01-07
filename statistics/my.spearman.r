my.spearman<-function(data1,data2){
	c1=cor(data1,data2, method="spearman")
	cat("Spearman Correlation Coef=", c1, "\n")
	sigma1 = sqrt(1/(length(data2)-1))
	zvalue = c1/sigma1
	cat("zvalue=", zvalue, "\n")
	pvalue = (1-pnorm(zvalue))*2
	cat("pvalue=", pvalue, "\n")



}