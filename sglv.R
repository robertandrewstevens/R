sglv <- function() {
  # Standard Gaussian Letter-values and letter-spreads (EDTTS p. 427)
  Tag <- c("F", "E", "D", "C", "B", "A", "Z", "Y", "X", "W", "V", "U", "T", "S")
  n <- length(Tag)
  Area <- 1/(rep(2, n)^c(2:(n + 1)))
  LV <- qnorm(1 - Area)
  LS <- 2 * LV
  value <- data.frame(Area, Tag, LV, LS)
  value
}