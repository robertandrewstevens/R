Cpk <- function(data, LSL, USL) {
  mu <- mean(data)
  sigma <- sqrt(var(data))
  CPL <- (mu - LSL)/(3 * sigma)
  CPU <- (USL - mu)/(3 * sigma)
  Index <- min(CPL, CPU)
  Index
}