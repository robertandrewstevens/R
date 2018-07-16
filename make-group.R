> make.group
function(time)
{
  # group failure data
  #
  n.obs <- length(time)
  delete <- rep("F", n.obs)
  fail <- rep(1, n.obs)
  for(i in seq(along = time)) {
    cat("i = ", i, "T = ", time[i], "n = ", fail[i], "\n")
    if(i > 1)
      if(time[i] == time[i - 1]) {
        cat("match at i =", i, "\n")
        fail[i - 1] <- fail[i - 1] + 1
        delete[i] <- "T"
        cat("i = ", i - 1, "T = ", time[i - 1], "n = ", fail[i - 1], "\n")
      }
  }
  time <<- time[delete == "F"]
  fail <<- fail[delete == "F"]
}
