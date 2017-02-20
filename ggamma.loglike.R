ggamma.loglike <- function(data, mu, sigma, lambda) {
  # Generalized Gamma Log Likelihood in original scale (not log scale)
  # For Uncensored data only
  # Based on Lawless, p. 244

  n <- length(data)
  k <- 1/lambda^2
  beta <- lambda/sigma
  theta <- exp(mu - (sigma * log(1/lambda^2))/lambda)
  y <- data/theta
  sum1 <- sum(log(y))
  sum2 <- sum(y^beta)
  value <- n * log(beta) - n * lgamma(k) - n * log(theta) + (k * beta - 1) * sum1 - sum2
  value
}
