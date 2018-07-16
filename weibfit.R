> weibfit
function(time, cens, beta0 = 1, alpha0 = sum(time)/sum(cens))
{
  # 2-parameter Weibull estimation
  # ala Rob Kushler
  # requires function "wlnl" (Weibull Log Likelhood)
  # 
  ms.data <- data.frame(time, cens)
  parameters(ms.data) <- list(beta = beta0, alpha = alpha0)
  print(ms.data)
  ms.fit <- ms( ~  - wlnl(time, cens, beta, alpha), data = ms.data, trace = T)
  summary(ms.fit)
  ms.pro <- profile(ms.fit)
  print(ms.pro)
}