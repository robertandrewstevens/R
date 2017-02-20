clv <- function() {
  # Cauchy distribution Letter-values and letter-spreads (EDTTS p. 429)
  Tag <- c("F", "E", "D", "C", "B", "A", "Z", "Y", "X")
  n <- length(Tag)
  Area <- 1 - 1/(rep(2, n)^c(2:(n + 1)))
  LV.C <- qcauchy(Area)
  LS.C <- 2 * LV.C
  LS.N <- 2 * qnorm(Area)
  PS <- LS.C/LS.N
  value <- data.frame(Tag, Area, LV.C, LS.C, LS.N, PS)
  value
}