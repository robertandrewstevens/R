circle.bak <- function(r, x0, y0) {
  a <- seq(0, 2 * pi, len = 100)
  x <- x0 + r * cos(a)
  y <- y0 + r * sin(a)
  plot(x, y, type = "l")
}