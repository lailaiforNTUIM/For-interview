my.wilcoxsign<-function(df1,alternative){
df1$diff = df1[,1] - df1[,2]
df1$absdiff = abs(df1$diff)
out1=shapiro.test(df1$diff)
print(out1)
#generate rank
alldata = sort(df1$absdiff)
alldata=alldata[alldata!=0]
n=length(alldata)
print(n)
tmpdf = data.frame(raw=alldata, rank=1:length(alldata))
avgrank = aggregate(tmpdf, by=list(tmpdf$raw), FUN=mean)
avgrank$Group.1=NULL

#take all positive diff
ind1 = df1$diff > 0
samp1=data.frame(raw=df1[ind1,"diff"])
samp1=merge(samp1, avgrank)
T=sum(samp1$rank)
ET=n*(n+1)/4 
SigmaT=sqrt(n*(n+1)*(2*n+1)/24)

z=(T-ET)/SigmaT
if(alternative=="less")
pvalue = pnorm(z)
else if(alternative=="greater")
pvalue= 1-pnorm(z)
cat("E(T)=", ET, "\n")
cat("Sigma_T=", SigmaT, "\n")
cat("z value=", z, "\n")
cat("p-value=", pvalue, '\n')





}