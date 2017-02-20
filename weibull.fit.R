weibull.fit <- function(time, cens, beta0 = 1, eta0 = sum(time)/sum(cens)) {
  # 2-parameter Weibull estimation
  # from Rob Kushler
  # requires function "wlnl" (Weibull Log Likelhood)
  # 
  ms.data <- data.frame(time, cens)
  parameters(ms.data) <- list(beta = beta0, eta = eta0)
  #print(ms.data)
  ms.fit <- ms( ~  - wlnl(time, cens, beta, eta), data = ms.data, trace = T)
  summary(ms.fit)
}