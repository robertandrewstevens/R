wlnl <- function(time, cens, beta, eta) {
  temp <- (time/eta)^beta
  lnt <- log(time)
  lne <- log(eta)
  value <- cens * (log(beta) - beta * lne + (beta - 1) * lnt) - temp
  value
}