mypropest<-function(sampl,alpha=0.05,ph0,testtype){

if(testtype=="righttail"){
mean1=mean(sampl)
long=length(sampl)
lcl=mean1-qnorm(1-alpha/2)*sd(sampl)/sqrt(long)
ucl=mean1+qnorm(1-alpha/2)*sd(sampl)/sqrt(long)
zvalue=(mean1-ph0)*sqrt(long)/sd(sampl)
pvalue=1-pnorm(zvalue)
if(pvalue<alpha){
reject=TRUE}
else{
reject=FALSE}
ans<-c(lcl,ucl,pvalue,long,zvalue,reject)
return(ans)
}
if(testtype=="lefttail"){
mean1=mean(sampl)
long=length(sampl)
lcl=mean1-qnorm(1-alpha/2)*sd(sampl)/sqrt(long)
ucl=mean1+qnorm(1-alpha/2)*sd(sampl)/sqrt(long)
zvalue=(mean1-ph0)*sqrt(long)/sd(sampl)
pvalue=pnorm(zvalue)
if(pvalue<alpha){
reject=TRUE}
else{
reject=FALSE}
ans<-c(lcl,ucl,pvalue,long,zvalue,reject)

return(ans)

}
if(testtype=="twotail"){
mean1=mean(sampl)
long=length(sampl)
lcl=mean1-qnorm(1-alpha/2)*sd(sampl)/sqrt(long)
ucl=mean1+qnorm(1-alpha/2)*sd(sampl)/sqrt(long)
zvalue=(mean1-ph0)*sqrt(long)/sd(sampl)
pvalue=pnorm(zvalue)
if(pvalue*2<alpha){
reject=TRUE}
else{
reject=FALSE}
ans<-c(lcl,ucl,pvalue,long,zvalue,reject)


return(ans)
}
if(long*pvalue<5&long*(1-pvalue)<5){return (NULL)}
if(alpha<=0|alpha>=1|ph0<=0|ph0>=1|(testtype!="twotail"&testtype!="righttail"&testtype!="lefttail")){
return(NULL)
}


}
