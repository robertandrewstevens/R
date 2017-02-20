lvd.t <- function(Tag, LV.L, LV.U, n) {
  # Letter-value display given table of data (EDTTS p. 421 & 423)
  k <- length(Tag)
  Depth <- rep(0, 5)
  Depth[1] <- (n + 1)/2
  for(i in 2:(k - 1))
    Depth[i] <- (floor(Depth[i - 1]) + 1)/2
  Depth[k] <- 1
  MV <- mid(LV.L, LV.U)
  cat("n = ", n, "\n")
  value <- data.frame(Tag, Depth, LV.L, MV, LV.U)
  value
}