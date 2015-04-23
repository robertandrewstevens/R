# http://menugget.blogspot.com/2013/01/producing-animated-gifs-and-videos.html

###Required function
source("spirographR.R") #http://menugget.blogspot.de/2012/12/spirograph-with-r.html

###Required package
require(animation)

###Create spirograph
a.rad = 4
b.rad = -5
bc = 2
a.rev = 5
n.per.a.rev=180
coord <- spirographR(
  A.RADIUS=a.rad,
  B.RADIUS=b.rad,
  BC=bc,
  A.REV=a.rev,
  N.PER.A.REV=n.per.a.rev 
)

plot(coord, asp=1, t="l")


#######################
### Make animated GIF #
#######################

# Define path to convert.exe (http://www.imagemagick.org)
ani.options(
  convert = shQuote('C:/Program Files (x86)/ImageMagick-6.8.1-Q16/convert.exe')
)

#Setup
STEPS <- seq(1, length(coord$x), , 100) #reduces the number of frames
SEQ <- seq(length(coord$x))
TAIL <- 150

COL1 <- heat.colors(TAIL)
PAL <- colorRampPalette(c("blue", "cyan", "white"))
COL2 <- PAL(TAIL)
LWD <- seq(0.1,10,,TAIL)

#Make GIF
saveGIF(
{
  par(mar=c(0,0,0,0), bg=1);
  for(i in round(STEPS)) {
    #i=850
    plot(coord$x, coord$y, asp=1, t="n")
    STARTS1 <- (c(i:(i+TAIL-1)) %% length(coord$x)) + 1
    STOPS1 <- c(i:(i+TAIL-1)) %% length(coord$x) + 2
    segments(x0=coord$x[STARTS1], x1=coord$x[STOPS1], y0=coord$y[STARTS1], y1=coord$y[STOPS1], col=COL1, lwd=LWD)
    
    j <- i + TAIL*2
    STARTS2 <- (c(j:(j+TAIL-1)) %% length(coord$x)) + 1
    STOPS2 <- c(j:(j+TAIL-1)) %% length(coord$x) + 2
    segments(x0=coord$x[STARTS2], x1=coord$x[STOPS2], y0=coord$y[STARTS2], y1=coord$y[STOPS2], col=COL2, lwd=LWD)
    
  }
},
movie.name = "spirograph2.gif", 
interval = 0.02, 
ani.width = 300, 
ani.height = 300,
nmax=length(SEQ),
outdir = getwd()
)


################
###Make video###
################

# Setup
SEQ <- seq(1, length(coord$x), , 300)
COL <- rainbow(length(coord$x)-1)
LWD <- seq(1, 10, , length(coord$x)-1)

#Make video
saveVideo({
  par(mar=c(0,0,0,0), bg=1);
  for(i in seq(SEQ)[-1]) {
    plot(coord$x, coord$y, asp=1, t="n")
    segments(x0=coord$x[seq(SEQ[i])[-(SEQ[i])]], x1=coord$x[seq(SEQ[i])[-1]], y0=coord$y[seq(SEQ[i])[-(SEQ[i])]], y1=coord$y[seq(SEQ[i])[-1]], col=COL[seq(SEQ[i])], lwd=LWD[seq(SEQ[i])])
  }
},
video.name = "spirograph.mp4", 
interval = 0.05, 
ani.width = 300, 
ani.height = 300,
nmax=length(SEQ),
outdir = getwd()
)
