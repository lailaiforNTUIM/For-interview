Chi_Square_Normal_Test <- function(x, n) {
  	break_p <- vector("double", length = n + 1)
	x_mean <- mean(x)
	x_stdev <- sqrt(var(x))
	break_p[1] <- min(x) - 1
	size <- length(x)
	for(j in 2:n) {
	break_p[j] <- qnorm((j-1)/n, mean = x_mean, sd = x_stdev, lower.tail = TRUE, log.p = FALSE)
	}
	break_p[n+1] <- max(x) + 1
	p_x <- hist(x, breaks = break_p, plot = FALSE)
	x_Counts <- p_x$counts
	Norm_counts <- vector("double", length = n)
	for(j in 1:n) {
	Norm_counts[j] <- size * 1/n
	}
	normal_fit <- chisq.test(x_Counts, p = Norm_counts, rescale.p = TRUE)
	Chitest_value <- pchisq(normal_fit$statistic, df = n - 3, lower.tail=FALSE)
   return(Chitest_value)
}
