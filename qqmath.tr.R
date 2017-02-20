qqmath.tr <- function(x) {
  # V&R p. 165 (2nd ed.)
  qqmath( ~ x, distribution = qnorm, aspect = "xy", prepanel = prepanel.qqmathline, panel = function(x, y, ...)
  {
    panel.qqmathline(y, distribution = qnorm, ...)
    panel.qqmath(x, y, ...)
  }
  , xlab = "Unit Normal Quantile")
}