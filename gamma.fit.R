gamma.fit <- function(data.values, k0, a0) {
  # Gamma parameter estimation
  # for uncensored data only
  # requires function "gamma.lnL" (Log Likelhood)
  # 
  ms.data <- data.frame(data.values)
  parameters(ms.data) <- list(k = k0, a = a0)
  ms.fit <- ms( ~  - gamma.lnL(data.values, k, a), data = ms.data, trace = F)
  ms.fit
}