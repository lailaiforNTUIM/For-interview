standarized_errors_MR <- function(y, x) {
   D<-c(NULL)
   n <- length(y)
   k <- ncol(x)
   x1 <- vector("double", length = n)
   for(j in 1:n) {
      x1[j] <- 1
      }
   Matrix_X <- cbind(x1, x)
   Matrix_Y <- cbind(y)
   Matrix_H <- Matrix_X%*%solve(t(Matrix_X)%*%Matrix_X)%*%t(Matrix_X)
   Matrix_YP <- Matrix_H%*%Matrix_Y
   y_p <- Matrix_YP[,1]
   h <- vector("double", length = n)
   Error <- vector("double", length = n)
   Standard_E <- vector("double", length = n)
   se <- sqrt(sum((y - y_p)^2)/(n - k - 1))
   for(i in 1:n) {
      h[i] <- Matrix_H[i,i]
      Error[i] <- y[i] - y_p[i]
      Standard_E[i] <- Error[i] / (se * sqrt(1 - h[i]))
      D[i] <- (y[i] - y_p[i])^2 * h[i] / ((k -1) * se^2 * (1 - h[i])^2)
      }
   return(Standard_E)
}
