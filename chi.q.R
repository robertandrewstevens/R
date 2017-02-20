chi.q <- function() {
  # Selected quantiles of the chi-squared distribution on 6 df (EDTTS p. 443)
  p <- c(0.5, 0.25, 0.1, 0.05, 0.025, 0.01, 0.005)
  n <- length(p)
  q.l <- qchisq(p, 6)
  q.u <- qchisq(1 - p, 6)
  spread <- q.u - q.l
  mv <- mid(q.l, q.u)
  plot(q.l[-1], q.u[-1])
  abline(2 * q.l[1], -1)
  value <- data.frame(p, q.l, q.u, spread, mv)
  value
}