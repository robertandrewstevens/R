uvlplot <- function(x) {
  # Upper-versus-Lower Plot (EDTTS p. 442)
  n <- length(x)
  k <- (n + 1)/2
  sort.x <- sort(x)
  if(n %% 2 == 0) { # even
    low <- sort.x[1:floor(k)]
    up <- rev(sort.x[(floor(k) + 1):n])
  }
  else { # odd
    low <- sort.x[1:(k - 1)]
    up <- rev(sort.x[(k + 1):n])
  }
  plot(low, up)
  abline(2 * median(x), -1)
  spread <- up - low
  mv <- mid(low, up)
  value <- data.frame(low, up, spread, mv)
  value
}