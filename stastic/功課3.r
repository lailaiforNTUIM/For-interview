
genpop1=function(size=10000, mixprob=0.6, m1=100, sd1=10, m2=150, sd2=20) {
    tmpseed = .Random.seed
    set.seed(5523)    
    #flip coins with mixprob success prob.
    coin1 = runif(size) < mixprob    
    
    rn1 = rnorm(size, m1, sd1)
    rn2 = rnorm(size, m2, sd2)
    
    rnfinal = rn2
    rnfinal[coin1] = rn1[coin1]
    .Random.seed = tmpseed
    return(rnfinal)
}

genpop2 = function(size=12000, lambda=140) {
    tmpseed = .Random.seed
    set.seed(5524)
    tmp1 = rpois(size, lambda)
    .Random.seed = tmpseed
    return(tmp1)
}

set.seed(1001) #to get .Random.seed defined.
pop1 = genpop1()
pop2 = genpop2()
p1mean=mean(pop1)
p2mean=mean(pop2)
p1std=sd (pop1)*((9999/10000)^(1/2))
p2std=sd (pop2)*((11999/12000)^(1/2))#第一題end
hist(pop1)
hist(pop2)#第二題end
ex<-p1mean-p2mean
vax<-((p1std^2)/100+(p2std^2)/50)^(1/2)#第三題end
myrunfor45<-function(x){               #x輸入rrun要跑幾次  #4.5題end
d<-vector(mode="numeric",length=x)
var4 <-vector(mode="numeric",length=x)
for(i in 1:x){
sappop1<-sample(pop1,100)
sappop2<-sample(pop2,50)
m4<-mean(sappop1)-mean(sappop2)
d[i]<-m4
}
mean4<-mean(d)
std4 <-sd(d)     #第四題 end
ans<-c(mean4,std4)#x霸的mean,跟x霸的std
return (ans)
}                #
cat("第一題答案mean",p1mean,"p2的",p2mean,"\n")
cat("第一題答案的std",p1std,"p2的",p2std,"\n")
cat("第三題的mean答案為",ex,"\n")
cat("第三題的sd為",vax,"\n")








