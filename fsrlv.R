fsrlv <- function() {
  # Folded square root distribution Letter-values and letter-spreads (EDTTS p. 428)
  Tag <- c("F", "E", "D", "C", "B", "A", "Z", "Y", "X", "W")
  n <- length(Tag)
  Area <- 1 - 1/(rep(2, n)^c(2:(n + 1)))
  LV.F <- fsr(Area)
  LS.F <- 2 * LV.F
  LS.N <- 2 * qnorm(Area)
  PS <- LS.F/LS.N
  value <- data.frame(Tag, Area, LV.F, LS.F, LS.N, PS)
  value
}
