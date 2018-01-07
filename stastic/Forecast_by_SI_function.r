Forecast_by_SI <- function(x, q, s, SI, t) {
	k <- length(x)
	Des_x <- vector("double", length = k)
	for(i in 1:k) {
		Des_x[i] <- x[i] / SI[q[i]]
	} 
	linearModelVar <- lm(Des_x ~ t)
	b0 <- coef(linearModelVar)[1]
	b1 <- coef(linearModelVar)[2]
	new_k <- k + s
	new_lb <- k + 1
	Q_t <- vector("double", length = new_k)
	SI_Q_t <- vector("double", length = new_k)
	for(i in 1:k) {
		Q_t[i] <- q[i]
	}
	for(j in new_lb:new_k) {
		Q_t[j] <- j - k
	}

	for(i in 1:new_k) {
		SI_Q_t[i] <- SI[Q_t[i]]
	}
	F_t <- 0:(new_k - 1)
	des_y <- b0 + b1 * F_t
	y <- des_y * SI_Q_t
	plot(t, x, col = "blue", main = "x against period", xlab = "period", ylab = "x", xlim=range(t, F_t, new_k), ylim=range(x, Des_x, des_y, y, 0))
	lines(t, x, type="o", col = "blue")
	lines(t, Des_x, type="o", col = "red")
	lines(F_t, des_y, type="o", col = "green")
	lines(F_t, y, type="o", col = "black")
	return(y)
}