pushback.t <- function(tag, lv, n) {
  # Pushback analysis given table of tags, letter-values, and sample size (EDTTS p. 450)
  x.lo <- rev(lv[1:7])
  x.up <- lv[9:15]
  p.lo <- 1/rep(2, 7)^c(2:8)
  p.up <- 1 - p.lo
  p.lo <- rev(p.lo)
  p.lo[1] <- p.i(1, n)
  p.up[7] <- p.i(n, n)
  p.lv <- c(p.lo, 0.5, p.up)
  z.lo <- qnorm(p.lo)
  z.up <- qnorm(p.up)
  z.lv <- c(z.lo, 0, z.up)
  std <- median((x.up - x.lo)/(z.up - z.lo))
  cat("s = ", std, "\n")
  sxz <- std * z.lv
  diff <- lv - sxz
  plot(z.lv, diff)
  value <- data.frame(tag, lv, z.lv, sxz, diff)
  value
}