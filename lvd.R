lvd <- function(x) {
  # Letter-value display (EDTTS p. 421 & 423)
  n <- length(x)
  Tag <- c("M", "F", "E", "D", " ")
  Depth <- rep(0, 5)
  Depth[1] <- (n + 1)/2
  for(i in 2:4)
    Depth[i] <- (floor(Depth[i - 1]) + 1)/2
  Depth[5] <- 1
  sort.x <- sort(x)
  LV.L <- rep(0, 5)
  LV.L[1] <- median(x)
  LV.L[2] <- mid(sort.x[5], sort.x[6])
  LV.L[3] <- sort.x[3]
  LV.L[4] <- sort.x[2]
  LV.L[5] <- min(x)
  LV.U <- rep(0, 5)
  LV.U[1] <- median(x)
  LV.U[2] <- mid(sort.x[n - 4], sort.x[n - 5])
  LV.U[3] <- sort.x[n - 2]
  LV.U[4] <- sort.x[n - 1]
  LV.U[5] <- max(x)
  MV <- mid(LV.L, LV.U)
  value <- data.frame(Tag, Depth, LV.L, MV, LV.U)
  value
}
