Center_Moving_Average <- function(x, q, s) {
	k <- length(x)
	y <- vector("double", length = k)
	SE <- vector("double", length = k)
	SI <- vector("double", length = s)
	c <- vector("double", length = s)
	if(s %% 2 == 0){
	lb = s / 2
	lb2 = lb + 1
	ub = k - (s / 2)
	cmv_y <- vector("double", length = k)
	for(i in lb:ub) {
		sum_x = 0
		lb_cmv = i - lb + 1
		ub_cmv = i + lb
		for(j in lb_cmv:ub_cmv){
			sum_x <- sum_x + x[j]
		}
		cmv_y[i] <- sum_x / s
	}
	for(i in lb2:ub) {
		y[i] <- (cmv_y[i-1] + cmv_y[i]) / 2
		SE[i] <- x[i] / y[i]
		SI[q[i]] <- SI[q[i]] + SE[i]
	}
	SI <- SI / ((k / s) - 1)
	sum_SI <- sum(SI)
	SI <- SI * s / sum_SI
	} else {
	lb = ceiling(s / 2)
	ub = k - floor(s / 2)
	for(i in lb:ub) {
		sum_x = 0
		lb_cmv = i - lb + 1
		ub_cmv = i + lb - 1
		for(j in lb_cmv:ub_cmv){
			sum_x <- sum_x + x[j]
		}
		y[i] <- sum_x / s
		SE[i] <- x[i] / y[i]
		SI[q[i]] <- SI[q[i]] + SE[i]
		c[q[i]] = c[q[i]]+1
	}
	SI <- SI / c
	sum_SI <- sum(SI)
	SI <- SI * s / sum_SI
	}
	return(SI)
}