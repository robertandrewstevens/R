> gbeta.like
function(T1, fail, b)
{
  #	Grouped Crow-AMSAA Beta Likelihood
  #
  k <- length(T1)
  ln.Tk <- log(T1[k])
  T0 <- c(0, T1[ - k])
  ln.T1 <- log(T1)
  ln.T0 <- rep(0, k)
  for(i in seq(along = ln.T0))
    if(i > 1) ln.T0[i] <- log(T0[i])
  T1.b <- T1^b
  T0.b <- T0^b
  top <- T1.b * ln.T1 - T0.b * ln.T0
  bot <- T1.b - T0.b
  ratio <- top/bot
  abs(sum(fail * (ratio - ln.Tk)))
}