# http://blog.revolutionanalytics.com/2014/02/3d-plots-in-r.html

library(plot3D)

# 3D Plot of Half of a Torus
par(mar = c(2, 2, 2, 2))
par(mfrow = c(1, 1))
R <- 3
r <- 2
x <- seq(0, 2*pi,length.out = 50)
y <- seq(0, pi,length.out = 50)
M <- mesh(x, y)

alpha <- M$x
beta <- M$y

surf3D(x = (R + r*cos(alpha))*cos(beta),
       y = (R + r*cos(alpha))*sin(beta),
       z = r * sin(alpha),
       colkey = FALSE,
       bty = "b2",
       main = "Half of a Torus")