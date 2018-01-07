



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






