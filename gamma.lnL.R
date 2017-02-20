gamma.lnL <- function(data, k, a) {
  # Gamma Log Likelihood
  # For Uncensored data only
  # Based on Lawless, p. 204

  n <- length(data)
  amean <- mean(data)
  gmean <- exp(mean(log(data)))
  value <-  - n * k * log(a) - n * lgamma(k) + n * (k - 1) * log(gmean) - (n * amean)/a
  value
}