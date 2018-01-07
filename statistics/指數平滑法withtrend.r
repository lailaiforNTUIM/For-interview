Exponential_Smoothing_with_Trend <- function(x, a, b, f, l) {
   k <- length(x)
   y <- vector("double", length = k + 1)
   LT <- vector("double", length = k + 1)
   ET <- vector("double", length = k + 1)
   y[1] <- f + l
   LT[1] <- a * (x[1] - f) + (1-a) * (y[1] - f)
   ET[1] <- b * LT[1] + (1-b) * l
   ub_es = k + 1
   for(i in 2:k) {
      j <- i - 1
      y[i] <- a * x[j] + (1-a) * y[j] + ET[j]
      LT[i] <- a * (x[i] - x[j]) + (1-a) * (y[i] - y[j])
      ET[i] <- b * LT[i] + (1-b) * ET[j]
   }
   y[ub_es] <- a * x[k] + (1-a) * y[k] + ET[k]
   return(y)
}
