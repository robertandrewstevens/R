Cp <- function(data, LSL, USL) {
  sigma <- sqrt(var(data))
  Index <- (USL - LSL)/(6 * sigma)
  Index
}
