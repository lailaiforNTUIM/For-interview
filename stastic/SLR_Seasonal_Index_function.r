Linear_Regression_Seasonal_Index <- function(x, q, s) {
	k <- length(x)
	SE <- vector("double", length = k)
	SI <- vector("double", length = s)
	t <- 0:(k - 1)
	linearModelVar <- lm(x ~ t)
	b0 <- coef(linearModelVar)[1]
	b1 <- coef(linearModelVar)[2]
	y <- b0 + b1 * t
	for(i in 1:k) {
		SE[i] <- x[i] / y[i]
		SI[q[i]] <- SI[q[i]] + SE[i]
	}
	SI <- SI / ((k / s) - 1)
	sum_SI <- sum(SI)
	SI <- SI * s / sum_SI
	return(SI)
}