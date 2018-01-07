Mean_Absolute_Deviation <- function(x, y, s) {
   k <- length(x)
   Sum_E <- 0
   for(i in s:k) {
      Sum_E <- Sum_E + abs(x[i] - y[i])
   }
   MAD <- Sum_E / (k - s + 1)
   return(MAD)
}
Mean_Square_Error <- function(x, y, s) {
   k <- length(x)
   Sum_E <- 0
   for(i in s:k) {
      Sum_E <- Sum_E + (x[i] - y[i])^2
   }
   MSE <- Sum_E / (k - s + 1)
   return(MSE)
}
Mean_Absolute_Percentage_Error <- function(x, y, s) {
   k <- length(x)
   Sum_E <- 0
   for(i in s:k) {
      if(x[i] != 0) {
         Sum_E <- Sum_E + abs(x[i] - y[i])/x[i]
      } else {
         Sum_E <- Sum_E + abs(x[i] - y[i])/mean(x)
         }	
     }
   MAPE <- Sum_E / (k - s + 1)
   return(MAPE)
}
