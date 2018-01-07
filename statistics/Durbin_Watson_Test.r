Durbin_Watson_Test <- function(x) {
	
	x_square_sum <- sum(x*x)
	size <- length(x)
	x_d <- vector("double", length = size)
	x_d[1] = 0
	for(j in 2:size) {
	x_d[j] <- x[j] - x[j - 1]
	}
	d <- sum(x_d*x_d) / x_square_sum
    return(d)
}