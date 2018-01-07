mytype2<-function(h1mean,h0mean,type,alpha=0.05,psigma,size){
zcv=qnorm(1-alpha)
xcv=h0mean+zcv*(psigma/sqrt(size))
ztype2=(xcv-h1mean)/(psigma/sqrt(size))
if(type=="righttail"){
	ptype2=pnorm(ztype2)
}
if(type=="lefttail"){
	xcv=h0mean-zcv*(psigma/sqrt(size))
	ztype2=(xcv-h1mean)/(psigma/sqrt(size))
	ptype2=1-pnorm(ztype2)
}
if(type=="two tail"){
zcv=qnorm(1-alpha/2)
xcvr=h0mean+zcv*(psigma/sqrt(size))
xcvl=h0mean-zcv*(psigma/sqrt(size))
}
ptest=1-ptype2
return (ptype2)

}