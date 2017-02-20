ggamma.fit.bak <- function(data.values, mu0, sigma0, lambda0) {
  # generalized gamma parameter estimation
  # for uncensored data only
  # requires function "ggamma.lnL" (Log Likelhood)

  ms.data <- data.frame(data.values)
  parameters(ms.data) <- list(mu = mu0, sigma = sigma0, lambda = lambda0)
  ms.fit <- ms( ~  - ggamma.lnL(data.values, mu, sigma, lambda), data = ms.data, trace = F)
  ms.fit
}