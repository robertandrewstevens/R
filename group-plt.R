> group.plt
function(alpha)
{
  # plot Final MTBF versus Final Time given initial MTBF and alpha
  mtbf.f <- seq(100, 1000, 10)
  mtbf.i <- 10
  time.f <-  - mtbf.i * log(1 - 0.95)((((1 - alpha) * mtbf.f)/mtbf.i))^(1/alpha)
  plot(mtbf.f, time.f, type = "l", lty = 1)
}

