ggamma.lnL.bak <- function(data, mu, sigma, lambda) {
  # Generalized Gamma Log Likelihood
  # For Uncensored data only
  # Based on Lawless, p. 244

  n <- length(data)
  k <- 1/lambda^2
  y <- log(data)
  w <- (y - mu)/sigma
  sum1 <- sum(w)
  sum2 <- sum(exp(w/k^0.5))
  value <- n * (k - 0.5) * log(k) - n * lgamma(k) - n * log(sigma) + (k^0.5) * sum1 - k * sum2
  value
}