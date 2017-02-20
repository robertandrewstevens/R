lvd.ps.t <- function(Tag, LV.L, LV.U, n) {
  # Letter-value display given table of data (EDTTS p. 430)
  k <- length(Tag)
  Depth <- rep(0, 5)
  Depth[1] <- (n + 1)/2
  for(i in 2:(k - 1))
    Depth[i] <- (floor(Depth[i - 1]) + 1)/2
  Depth[k] <- 1
  MV <- mid(LV.L, LV.U)
  LS <- LV.U - LV.L
  p.d <- 1 - p.i(Depth, n)
  z.d <- qnorm(p.d)
  LS.N <- 2 * z.d
  PS <- LS/LS.N
  plot(c( - z.d[-1], z.d), c(LV.L[-1], LV.U))
  cat("n = ", n, "\n")
  value <- data.frame(Tag, Depth, LV.L, MV, LV.U, p.d, z.d, LS, PS)
  value
}
