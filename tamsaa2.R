> tamsaa2
function(ctime, time)
{
  # Time Censored Crow-AMSAA parameter estimation and plot
  #
  #       ctime   = Censoring Time
  #       times   = vector of failure times
  #
  ln.x <- log(time)
  n <- length(time)
  beta.bias <- n/(n * log(ctime) - sum(ln.x))
  lamb.bias <- n/ctime^beta.bias
  end.bias <- lamb.bias * beta.bias * ctime^(beta.bias - 1)
  cat("Biased Beta = ", beta.bias, "\n")
  cat("Biased Lambda = ", lamb.bias, "\n")
  cat("Biased FR(End) = ", end.bias, "\n")
  beta.unbi <- (beta.bias * (n - 1))/n
  lamb.unbi <- n/ctime^beta.unbi
  end.unbi <- lamb.unbi * beta.unbi * ctime^(beta.unbi - 1)
  cat("Unbiased Beta = ", beta.unbi, "\n")
  cat("Unbiased Lambda = ", lamb.unbi, "\n")
  cat("Unbiased FR(End) = ", end.unbi, "\n")
  fail <- c(1:n)
  fit.time <- (ctime * c(0:100))/100
  fit.fail <- lamb.unbi * fit.time^beta.unbi
  diff.time <- time - c(0, time[ - n])
  fail.rate <- 1/diff.time	#
  #
  # repeat last data point so vector lengths match
  #
  time <- c(time, rep(time[n], length(fit.time) - n))
  fail <- c(fail, rep(fail[n], length(fit.fail) - n))
  par(mfrow = c(2, 1))	#
  #
  # Plot Cumulative Failures
  #
  matplot(cbind(time, fit.time), cbind(fail, fit.fail), type = "pl", pch = "*", lty = 1,
          xlab = "Cumulative Test Time", ylab = "Cumulative Failures",
          main = "Figure 6\nCumulative Failures versus Cumulative Test Time")	#
  #
  #  Plot failure rate intesity 
  #
  fit.rate <- lamb.unbi * beta.unbi * fit.time^(beta.unbi - 1)
  fail.rate <- c(fail.rate, rep(fail.rate[n], length(fit.rate) - n))
  matplot(cbind(time, fit.time), 1000 * cbind(fail.rate, fit.rate), type = "pl", pch = "*", lty = 1,
          ylim = c(0, max(1000 * fail.rate)), xlab = "Cumulative Test Time", ylab = "R/1000",
          main = "Figure 7\nR/1000 versus Cumulative Test Time")
  abline(h = 1000, lty = 2)
  text(0, 1000 + 250, "Requirement", adj = 0)
}

