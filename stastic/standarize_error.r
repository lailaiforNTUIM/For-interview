standarized_errors <- function(y, x) {
   n <- length(y)
   linearModelVar <- lm(y ~ x)
   a <- coef(linearModelVar)[1]
   b <- coef(linearModelVar)[2]
   se <- sigma(linearModelVar)
   x_mean <- mean(x)
   x_var <- var(x)
   h <- vector("double", length = n)
   y_p <- vector("double", length = n)
   Error <- vector("double", length = n)
   Standard_E <- vector("double", length = n)
   for(i in 1:n) {
      h[i] <- (1/n) + (x[i] - x_mean)^2 / (x_var * (n - 1))
      y_p[i] <- a + b * x[i]
      Error[i] <- y[i] - y_p[i]
      Standard_E[i] <- Error[i] / (se * sqrt(1 - h[i]))
      }
    return(Standard_E)
}