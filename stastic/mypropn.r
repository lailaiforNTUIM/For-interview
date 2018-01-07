mypropn<-function(width=0.01,alpha=0.05,phat=0.5){
if(width<=0|phat<=0|phat>=1|alpha<=0|alpha>=1){
return (NULL)
}
else{
z=qnorm(1-alpha/2)
ans<-(z*sqrt(phat*(1-phat))/width)^2

return(ans)
}

}

