> rg.cars
function()
{
  # plot Final Time versus Number of Cars given Miles per year per Car
  time.f <- seq(from = 0, to = 250000, length = 100)
  n.obs <- length(time.f)
  rate <- 175
  n.car1 <- time.f/rate
  rate <- 350
  n.car2 <- time.f/rate
  rate <- 700
  n.car3 <- time.f/rate
  plot(time.f, n.car1, type = "l", lty = 1, ylab = "Number Vehicle-Years", xlab = "Total Test Time (hours)")
  title(main = "Number of Vehicle-Years Needed to Accumulate Test Time\nGiven Rate (hours/vehicle-year)")
  lines(time.f, n.car2, type = "l", lty = 1)
  lines(time.f, n.car3, type = "l", lty = 1)
  text(time.f[n.obs], n.car1[n.obs], "Rate=175", adj = 1)
  text(time.f[n.obs], n.car2[n.obs], "Rate=350", adj = 1)
  text(time.f[n.obs], n.car3[n.obs], "Rate=700", adj = 1)
}

