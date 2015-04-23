# http://menugget.blogspot.com/2012/12/spirograph-with-r.html

#spirographR() will produce either a hypotrochoid or an epitrochoid. 
#'A' is a circle of radius 'A.RADIUS'
#'B' is a circle of radius 'B.RADIUS' travelling around 'A'
#'C' is a point relative to the center of 'B' which rotates with the turning of 'B'.
#'BC' is the distance from the center of 'B' to 'C'
#'A.REV' is the number of revolutions that 'B' should travel around 'A'
#'N.PER.A.REV' is the number of radial increments to be calculated per revolution
#'A.CEN' is the position of the center of 'A'
#
#NOTE: A positive value for 'B' will result in a epitrochoid, while a negative value will result in a hypotrochoid.

spirographR <- function (
  A.RADIUS=1, 
  B.RADIUS=-4, 
  BC=-2, 
  A.REV=4, 
  N.PER.A.REV=360,
  A.CEN=list(x=0, y=0)){
  
  B.CEN.START <- list(x=0, y=A.CEN$y + A.RADIUS + B.RADIUS) #starting position of B circle
  A.ANGLE <- seq(0, 2*pi*A.REV,, A.REV*N.PER.A.REV) #Radians around A for calculation
  A.CIR <- 2*pi*A.RADIUS #Circumference of A
  B.CIR <- 2*pi*B.RADIUS #Circumference of B
  
  ###Find position of B.CEN
  B.CEN <- c()
  HYP <- A.RADIUS + B.RADIUS
  ADJ <- sin(A.ANGLE) * HYP
  OPP <- cos(A.ANGLE) * HYP
  B.CEN$x <- A.CEN$x + ADJ 
  B.CEN$y <- A.CEN$y + OPP 
  
  ###Find position of C.POINT
  C.POINT <- c()
  A.CIR.DIST <- A.CIR * A.ANGLE / (2*pi)
  B.POINT.ANGLE <- A.CIR.DIST / B.CIR * 2*pi
  HYP <- BC
  ADJ <- sin(B.POINT.ANGLE) * HYP
  OPP <- cos(B.POINT.ANGLE) * HYP
  C.POINT$x <- B.CEN$x + ADJ 
  C.POINT$y <- B.CEN$y + OPP 
  
  ###Return trajectory of C
  C.POINT
}


#source("spirographR.R")

require(spatstat)

RES <- vector(mode="list", 100)
LIM <- c()
set.seed(1112)
for(i in seq(RES)){
  #i=1
  a.rad=sample(seq(1,10, 0.1),1) 
  b.rad=sample(seq(-3,10, 0.1),1)
  bc=sample(seq(-10,10),1)
  a.rev=least.common.multiple(abs(a.rad), abs(b.rad))
  tmp <- runif(2, min=-100, max=100)
  a.cen=list(x=tmp[1], y=tmp[2])
  LIM <- range(c(LIM, unlist(a.cen)))
  RES[[i]] <- spirographR(A.RADIUS=a.rad, B.RADIUS=b.rad, BC=bc, A.REV=a.rev, A.CEN=a.cen)
}


png("spirograph.png", width=4, height=4, units="in", res=600)
par(mar=c(0,0,0,0), bg=1)
for(i in seq(RES)) {  
  if(i == 1){
    plot(RES[[i]], t="n", xlim=LIM, ylim=LIM, asp=1)
  }
  lines(RES[[i]], col=rgb(runif(1), runif(1), runif(1), 0.8), lwd=0.3)
}
dev.off()
