> beta.like
function(data, fail, beta)
{
  n.obs <- length(data)	#
  t1 <- data
  t0 <- c(0, data[ - n.obs])	#
  t1.b <- t1^beta
  t0.b <- t0^beta	#
  ln.t1 <- log(t1)
  ln.t0 <- log(t0)
  ln.t0[1] <- 0	#
  top <- t1.b * ln.t1 - t0.b * ln.t0
  bot <- t1.b - t0.b
  ratio <- top/bot
  const <- log(data[n.obs])
  abs(sum(fail * (ratio - const)))
}