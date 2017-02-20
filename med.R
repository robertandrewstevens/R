med <- function(x) {
  n <- length(x)
  value <- qnorm((rank(x) - 1/3)/(n + 1/3))
  value
}
