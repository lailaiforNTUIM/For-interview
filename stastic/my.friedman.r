# df1 should be cbind
my.friedman<-function(df1){
df2=matrix(NA, nrow=nrow(df1), ncol=ncol(df1))
for(i in 1:nrow(df1)) {
    df2[i,] = grank(df1[i,])
}
T=colSums(df2)
b=nrow(df2); k=ncol(df2)
Fr=12/b/k/(k+1)*sum(T^2) - 3*b*(k+1)
pvalue=1-pchisq(Fr, k-1)
cat("Ts=", T, "\n")
cat("b=", b, "k=", k, "\n")
cat("Fr=", Fr, "\n")
cat("pvalue=", pvalue, "\n")




}
