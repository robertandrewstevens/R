> tau.profile
function(theta, se.theta)
{
  # Generation of tau and profile traces from Bates & Watts
  # Appendix 3.5.1
  #
  # Given theta & se(theta)
  # for each element of theta, find tau & profile
  #
  step <- 8	# initial value
  k.max <- 30	# initial value
  #
  for(p in seq(along = theta)) {
    delta <-  - se.theta[p]/step
    tau <- 0
    repeat {
      invslope <- 1
      for(k in seq(along = 1:k.max)) {
        tau <- tau + invslope	# minimize S(theta)
        # invslope_abs()			
        # record values
        invslope <- min(4, max(invslope, 1/16))
        if(abs(tau) > tau.max)
          break
      }
      delta <-  - delta
      if(delta < 0)
        break
    }
  }
}
