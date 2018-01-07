selectsample<-function(want,std,alpha){
zcv=qnorm(1-alpha/2)
stdsquare=std^2
ans=(zcv^2)*stdsquare/(want^2)
return(ans)

}
