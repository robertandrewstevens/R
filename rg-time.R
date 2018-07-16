> rg.time
function()
{
  # plot Final Time versus Number of Cars given Miles per year per Car
  time.f <- seq(5 * 10^5, 5 * 10^7, lengh = 100)
  n.obs <- length(time.f)
  rate <- 175
  n.car1 <- time.f/rate
  rate <- 350
  n.car2 <- time.f/rate
  rate <- 700
  n.car3 <- time.f/rate
  plot(time.f, n.car1, type = "l", lty = 1, log = "xy", ylab = "Number Vehicle-Years",
       xlab = "Total Test Time\n(hours)")
  title(main = "Number of Vehicle-Years Required to Accumulate Reliability Growth Test Time")
  lines(time.f, n.car2, type = "l", lty = 1)
  lines(time.f, n.car3, type = "l", lty = 1)
  text(time.f[n.obs], n.car1[n.obs], "Rate=175", adj = 1)
  text(time.f[n.obs], n.car2[n.obs], "Rate=350", adj = 1)
  text(time.f[n.obs], n.car3[n.obs], "Rate=700", adj = 1)
}

