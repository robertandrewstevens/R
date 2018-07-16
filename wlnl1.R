> wlnl1
function(time, cens, beta, alpha)
{
  temp <- (time/alpha)^beta
  lnt <- log(time)
  lna <- log(alpha)
  value <- cens * (log(beta) - beta * lna + (beta - 1) * lnt) - temp	#
  # provide derivatives for shape and alpha
  # grad <- array(0, c(length(value), 2), list(NULL, c("shape", "alpha")))
  # grad[, "shape"] <- cens * (1/shape - lna + lnt) - temp * (lnt - lna)
  # grad[, "alpha"] <- ((temp - cens) * shape)/alpha
  # attr(value, "gradient") <- grad	#
  # return value of function
  value
}