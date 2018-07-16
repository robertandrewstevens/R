> group
function(time, fail)
{
  n.obs <- length(time)
  beta <- find.b(time, fail)$parameters
  lambda <- sum(fail)/time[n.obs]^beta
  cat("Beta =", round(beta, 3), "Lambda =", round(lambda, 3), "\n")
  t0 <- c(0, time[ - n.obs])
  expect <- lambda * (time^beta - t0^beta)
  fit.stat <- sum((fail - expect)^2/expect)
  p.val <- 1 - pchisq(fit.stat, n.obs - 2)
  cat("Goodness of Fit Stat =", round(fit.stat, 3), "p-value =", round(p.val, 4), "\n")
}