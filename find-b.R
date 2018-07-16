> find.b
function(time, fail, beta0 = 1)
{
  # Find beta for grouped Crow-AMSAA
  # 
  # requires function "gbeta.like" (Grouped Beta Likelihood)
  # 
  ms.data <- data.frame(time, fail)
  parameters(ms.data) <- list(beta = beta0)
  print(ms.data)
  ms.fit <- ms( ~ gbeta.like(time, fail, beta), data = ms.data)	#
  #summary(ms.fit)	#
  #ms.pro <- profile(ms.fit)
  #print(ms.pro)
}