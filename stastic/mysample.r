mysample<-function(n,size){
	if(size>n) {size <- n}
	out2<- runif(n)
	out1<-c(1:n)
	ans = rbind (out1,out2)[,order(out2,out1)]
	if(size==0){
		ans <- numeric(0)
		return(ans)
	}
	else{
	ans<-ans[1,]
	ans<-ans[1:size]
	return(ans)
	}
	
	
	

}
