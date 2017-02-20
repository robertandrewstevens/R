eda.shape1 <- function(x, xname = deparse(substitute(x))) {
  o.par <- par(mfrow = c(2, 2))
  on.exit(par(o.par))
  truehist(x, xlab = xname)
  title("Histogram")
  boxplot(x, ylab = xname)
  title("Boxplot")
  iqd <- summary(x)[5] - summary(x)[2]
  plot(density(x, width = 2 * iqd), xlab = xname, ylab = "", type = "l")
  title("Smoothed Density Estimate")
  qqnorm(x, ylab = xname)
  qqline(x)
  title("Normal QQplot with Robust Fit")
}
