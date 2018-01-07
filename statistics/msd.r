mymsd=function(df1){
	dfn = df1[[1]]
	dfp = df1 [[2]]
	m=0
	s=0
	for(i in seq_along(dfn)){
		m<-m+dfn[i]*dfp[i]
	}
	for( i in seq_along(dfn)){
		s<-s+((dfn[i]-m)^2)*dfp[i]
	}
	s<-s^(0.5)
	ans<-c(m,s)
	return (ans)

}
