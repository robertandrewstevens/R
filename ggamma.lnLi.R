ggamma.lnLi <- function(data, mu, sigma, lambda) {
  # Generalized Gamma Log Likelihood - Individual value
  # For Uncensored data only
  # Based on Lawless, p. 242

  k <- 1/lambda^2
  y <- log(data)
  w <- (y - mu)/sigma
  value <- (k - 0.5) * log(k) - lgamma(k) - log(sigma) + (k^0.5) * w - k * exp(w/k^0.5)
  value
}