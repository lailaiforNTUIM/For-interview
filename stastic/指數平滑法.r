Exponential_Smoothing <- function(x, a) {
   k <- length(x)
   y <- vector("double", length = k + 1)
   y[1] = x[1]
   ub_es = k+1
   for(i in 2:ub_es) {
      j <- i - 1
      y[i] <- a * x[j] + (1-a) * y[j]
   }
   return(y)
}
