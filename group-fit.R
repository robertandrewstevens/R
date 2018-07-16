> group.fit
function(time, fail)
{
  n.obs <- length(time)
  beta <- find.b(time, fail)$parameters
  lambda <- sum(fail)/time[n.obs]^beta
  cat("Beta =", round(beta, 3), "Lambda =", round(lambda, 3), "\n")
  t0 <- c(0, time[ - n.obs])
  expect <- lambda * (time^beta - t0^beta)
  i <- 1
  while(i < n.obs) {
    if(expect[i] < 5) {
      fail[i + 1] <- fail[i] + fail[i + 1]
      time <- time[ - i]
      fail <- fail[ - i]
      n.obs <- n.obs - 1
      beta <- find.b(time, fail)$parameters
      lambda <- sum(fail)/time[n.obs]^beta
      cat("Beta =", round(beta, 3), "Lambda =", round(lambda, 3), "\n")
      t0 <- c(0, time[ - n.obs])
      expect <- lambda * (time^beta - t0^beta)
    }
    else i <- i + 1
  }
  if(expect[n.obs] < 5) {
    fail[n.obs - 1] <- fail[n.obs] + fail[n.obs - 1]
    time[n.obs - 1] <- time[n.obs]
    time <- time[ - n.obs]
    fail <- fail[ - n.obs]
    n.obs <- n.obs - 1
    beta <- find.b(time, fail)$parameters
    lambda <- sum(fail)/time[n.obs]^beta
    cat("Beta =", round(beta, 3), "Lambda =", round(lambda, 3), "\n")
    t0 <- c(0, time[ - n.obs])
    expect <- lambda * (time^beta - t0^beta)
  }
  fit.stat <- sum((fail - expect)^2/expect)
  p.val <- 1 - pchisq(fit.stat, n.obs - 2)
  cat("Goodness of Fit Stat =", round(fit.stat, 3), "p-value =", round(p.val, 4), "\n")
  interval <- time - c(0, time[ - n.obs])
  perct <- interval/time[n.obs]
  NPi <- sum(fail) * perct
  gro.stat <- sum((fail - NPi)^2/NPi)
  p.val <- 1 - pchisq(gro.stat, n.obs - 1)
  cat("Test for Trend Stat =", round(gro.stat, 3), "p-value =", round(p.val, 4), "\n")
  fit.time <<- time
  fit.fail <<- fail
  cat("Final time values are stored in 'fit.time'.\nFinal failure values are stored in 'fit.fail'.\n")
}