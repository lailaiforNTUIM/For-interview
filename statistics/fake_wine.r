fake_wine <-function(cw_consumed,cw_time,sw_consumed,sw_time){
df1=length(cw_consumed)-1
df3=length(cw_time)-1
df2=length(sw_consumed)-1
df4=length(sw_time)-1        
var1=var(cw_consumed)
var3=var(cw_time)
var2=var(sw_consumed)
var4=var(sw_time)
conlevel=0.05
fcritical1=qf(conlevel/2,df1,df2)
fcritical2=qf(1-conlevel/2,df1,df2)
f1=var1/var2
fcritical3=qf(conlevel/2,df3,df4)
fcritical4=qf(1-conlevel/2,df3,df4)
f2=var3/var4
v1=TRUE
v2=TRUE
if(f1>fcritical2||f1<fcritical1) v1=FALSE
if(f2<fcritical3||f2>fcritical4) v2=FALSE
xbar1=mean(cw_consumed)
xbar3=mean(cw_time)
xbar2=mean(sw_consumed)
xbar4=mean(sw_time)
if(v1){
	sp=(var1*df1+var2*df2)/(df1+df2)
	tvalue=(xbar1-xbar2)/sqrt(sp*((1/(df1+1))+(1/(df2+1))))
	pvalue1=1-pt(tvalue,df1+df2)

}
else{
	dv=(var1/(df1+1)+var2/(df2+1))^2/(((var1/(df1+1))^2/df1)+(var2/(df2+1))^2/df2)
	tvalue=(xbar1-xbar2)/sqrt(var1/(df1+1)+var2/(df2+1))
	pvalue1=1-pt(tvalue,dv)
}
if(v2){
	sp=(var3*df3+var4*df4)/(df3+df4)
	tvalue=(xbar3-xbar4)/sqrt(sp*((1/(df3+1))+(1/(df4+1))))
	pvalue2=1-pt(tvalue,df3+df4)
}
else{
	dv=(var3/(df3+1)+var4/(df4+1))^2/(((var3/(df3+1))^2/df3)+(var4/(df4+1))^2/df4)
	tvalue=(xbar3-xbar4)/sqrt(var3/(df3+1)+var4/(df4+1))
	pvalue2=1-pt(tvalue,dv)
}
list1 = list(var_equal_a = v1, var_equal_b= v2, pvalue_a= pvalue1, pvalue_b=pvalue2)



return(list1)

}
