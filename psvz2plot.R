psvz2plot <- function(x) {
  # Pseudosigma-versus-Z^2 Plot (EDTTS p. 449)
  n <- length(x)
  k <- (n + 1)/2
  sort.x <- sort(x)
  sort.p <- p(sort.x)
  if(n %% 2 == 0) {
    #even
    low <- sort.x[1:floor(k)]
    up <- rev(sort.x[(floor(k) + 1):n])
    p.up <- rev(sort.p[(floor(k) + 1):n])
  }
  else {
    #odd
    low <- sort.x[1:(k - 1)]
    up <- rev(sort.x[(k + 1):n])
    p.up <- rev(sort.p[(k + 1):n])
  }
  spread <- up - low
  mv <- mid(low, up)
  z <- qnorm(p.up)
  z2 <- z^2
  ps <- spread/(2 * z)
  plot(z2, ps)
  abline(median(x), 0)
  value <- data.frame(low, up, spread, mv, p.up, z, z2, ps)
  value
}