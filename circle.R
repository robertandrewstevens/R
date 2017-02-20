circle <- function(x, y, x0, y0, r, x.lab, y.lab) {
  a <- seq(0, 2 * pi, len = 100)
  circle.x <- x0 + r * cos(a)
  circle.y <- y0 + r * sin(a)
  min.x <- min(min(x), min(circle.x))
  max.x <- max(max(x), max(circle.x))
  min.y <- min(min(y), min(circle.y))
  max.y <- max(max(y), max(circle.y))
  plot(x, y, xlim = c(min.x, max.x), ylim = c(min.y, max.y), xlab = x.lab, ylab = y.lab)
  lines(circle.x, circle.y)
  abline(h = y0, lty = 2)
  abline(v = x0, lty = 2)
}