> group.p1
function(data)
{
  # plot grouped failure data
  n.obs <- length(data)
  delete <- rep("F", n.obs)
  fail <- rep(1, n.obs)
  for(i in seq(along = data)) {
    cat("i = ", i, "T = ", data[i], "n = ", fail[i], "\n")
    if(i > 1)
      if(data[i] == data[i - 1]) {
        cat("match at i =", i, "\n")
        fail[i - 1] <- fail[i - 1] + 1
        delete[i] <- "T"
        cat("i = ", i - 1, "T = ", data[i - 1], "n = ", fail[i - 1], "\n")
      }
  }
  data <- data[delete == "F"]
  fail <- fail[delete == "F"]
  n.obs <- length(data)
  data.lag <- c(0, data[ - n.obs])
  interval <- data - data.lag
  mtbf <- interval - fail
  for(i in seq(along = data))
    cat("i=", i, "T=", data[i], "Interval=", interval[i], "n=", fail[i], "MTBF=", mtbf[i], "\n")
  plot.x <- c(0, rep(data, rep(2, n.obs)))
  plot.y <- c(rep(mtbf, rep(2, n.obs)), 0)
  plot(plot.x, plot.y, type = "l", lty = 1)
}
