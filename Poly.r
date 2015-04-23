# S3 class for polynomial regression

# DESCRIBE ALTERNATIVES; COULD USE cv() THOUGH NOT IN OUR FORM; COULD
# USE MATRIX UPDATE, BUT NEED CHOLESKY TO MAKE IT REALLY WORK WELL

# polyfit(x,maxdeg) fits all polynomials up to degree maxdeg; y is
# vector for response variable, x for predictor
polyfit <- function(y,x,maxdeg) {
   pwrs <- powers(x,maxdeg)  # powers of predictor variable
   # lmout will be a list of outputs from the various regression models,
   # plus the original data
   lmout <- list()
   class(lmout) <- "polyreg"
   for (i in 1:maxdeg) {
      lmo <- lm(y ~ pwrs[,1:i])
      # extend the lm class here
      lmo$fitted.xvvalues <- lvoneout(y,pwrs[,1:i,drop=F])
      lmout[[i]] <- lmo
   }
   lmout$x <- x
   lmout$y <- y
   return(lmout)
}

# generic print(); call lm print() on each fit, pausing between fits
print.polyreg <- function(fits) {
   lp <- length(fits)
   for (i in 1:lp) {
      print.lm(fits[[i]])
      if (i < lp) readline("hit RETURN for next summary")
   }
}

# generic plot(); plots
plot.polyreg <- function(fits) {
   plot(fits$x,fits$y)  # plot data points as background
   maxdg <- length(fits)
   cols <- c("red","green","blue")
   for (dg in 1:maxdg) {
      prompt <- paste("hit RETURN for XV fit for degree",dg)
      readline(prompt)
      lines(fits$x,fits[[dg]]$fitted.xvvalues,col=cols[dg%%3 + 1])
   }
}

# forms matrix of powers of x, through degree dg
powers <- function(x,dg) {
   pw <- matrix(x,nrow=length(x))
   prod <- x
   for (i in 2:dg) {
      prod <- prod * x
      pw <- cbind(pw,prod)
   }
   return(pw)
}

# finds cross-validated residuals
lvoneout <- function(y,xmat) {
   n <- length(y)
   predy <- vector(length=n)
   for (i in 1:n) {
      lmo <- lm(y[-i] ~ xmat[-i,])
      betahat <- as.vector(lmo$coef)
      predy[i] <- betahat %*% c(1,xmat[i,])
   }
   return(predy)
}

# polynomial function of x, coefficients cfs
poly <- function(x,cfs) {
   val <- cfs[1]
   prod <- 1
   dg <- length(cfs) - 1
   for (i in 1:dg) {
      prod <- prod * x
      val <- val + cfs[i+1] * prod
   }
}

n <- 100
x <- (1:n)/n
y <- vector(length=n)
for (i in 1:n) 
   y[i] <- sin((3*pi/2)*x[i]) + x[i]^2 + rnorm(1,mean=0,sd=0.5)

dg <- 8
lmo <- polyfit(y,x,dg)

# plot(x,y)
# for (i in 1:dg) 
#    lines(lowess(x,lmo[[i]]$fitted.values))



