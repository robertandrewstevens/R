> pois.plt
function()
{
  # plot Poisson Distr. for Vehicle, HVSPS, Subsystem @ 1 year
  par(mfrow = c(3, 1), xaxs = "i")
  fail <- c(0:7)
  time <- 700	# hours in 1 year
  # Vehicle
  mtbf <- 429	# hours
  pdf <- dpois(fail, time/mtbf)
  barplot(pdf, names = as.character(fail), space = 0, ylim = c(0, 1), density = 5)	#
  # HVPSP
  mtbf <- 1443	# hours
  pdf <- dpois(fail, time/mtbf)
  barplot(pdf, names = as.character(fail), space = 0, ylim = c(0, 1), density = 5)	#
  # Subsystem
  mtbf <- 25000	# hours
  pdf <- dpois(fail, time/mtbf)
  barplot(pdf, names = as.character(fail), space = 0, ylim = c(0, 1), density = 5)
}