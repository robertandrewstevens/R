> group.gro
function(time, fail)
{
  n.obs <- length(time)
  interval <- time - c(0, time[ - n.obs])
  perct <- interval/time[n.obs]
  NPi <- sum(fail) * perct
  gro.stat <- sum((fail - NPi)^2/NPi)
  p.val <- 1 - pchisq(gro.stat, n.obs - 1)
  cat("Test for Trend Stat =", round(gro.stat, 3), "p-value =", round(p.val, 4), "\n")
}
