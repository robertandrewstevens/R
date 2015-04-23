# http://blog.revolutionanalytics.com/2013/01/how-to-make-your-own-3-d-sculpture-with-r.html

## Install rgl from R-forge with
## install.packages("rgl", repos="http://R-Forge.R-project.org")

library(rgl)

theta <- seq(0, 6*pi, len=2048)
sawtooth <- function(x) sin(x) + sin(2*x)/2
dsawtooth <- function(x) cos(x) + cos(2*x)

fb <- 21+1/3
x1 <- sawtooth(fb*theta)
dx1 <- dsawtooth(fb*theta)

offset <- 3*pi/3
y1 <- sawtooth(fb*theta - offset )
dy1 <- dsawtooth(fb*theta - offset)

r1 <- 0.1
r2 <- 0.4

k <- cylinder3d(cbind(sin(theta)+2*sin(2*theta), 2*sin(3*theta), cos(theta)-2*cos(2*theta)),
                e1=cbind(cos(theta)+4*cos(2*theta), 6*cos(3*theta), sin(theta)+4*sin(2*theta)),
                radius=0.8, closed=TRUE, keepVars=TRUE)

knot <- attr(k, "vars")
center <- cbind(0, x1, y1)*r2
e1 <- cbind(1, dx1, dy1)*r2
e2 <- cbind(rep(0, length(theta)), 1, 0)
for (i in 1:length(theta)) {
  trans <- cbind(knot$e1[i,], knot$e2[i,], knot$e3[i,])
  center[i,] <- knot$center[i,] + trans %*% center[i,]
  e1[i,] <- trans %*% e1[i,]
  e2[i,] <- trans %*% e2[i,]
}

braid <- addNormals(cylinder3d(center, e1=e1, e2=e2, radius=r1))
shade3d(braid, col="white")
writeSTL("braid.stl") # Error: could not find function "writeSTL"
