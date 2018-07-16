> cont.plt
function(data)
{
  # plot continuous reliability growth data
  no.obs <- length(data)
  cum.fail <- c(1:no.obs)
  plot(data, cum.fail, type = "l", lty = 1, log = "xy")
}