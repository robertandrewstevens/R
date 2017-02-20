uvlplot.t <- function(tag, low, up) {
  # Table version of Upper-versus-Lower Plot (EDTTS p. 442)
  plot(low, up)
  abline(2 * low[1], -1)
  spread <- up - low
  mv <- mid(low, up)
  value <- data.frame(tag, low, up, spread, mv)
  value
}