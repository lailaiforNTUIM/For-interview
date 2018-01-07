Moving_Average <- function(x, n) {
   k <- length(x)
   y <- vector("double", length = k + 1)
   lb = n + 1
   ub = k + 1
   for(i in lb:ub) {
       sum_x = 0
      lb_mv = i - n
      ub_mv = i - 1
      for(j in lb_mv:ub_mv){
         sum_x <- sum_x + x[j]
         }
      y[i] <- sum_x / n
   }
   return(y)
}
