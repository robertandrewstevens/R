# http://stackoverflow.com/questions/21018026/producing-an-animated-comet-plot-in-r
# TODO
# Try on Mac - ImageMagick
# Implement other code segments from this thread
# Try on PC - Graphics Magick mentioned @
# http://stackoverflow.com/questions/17570082/imagemagick-in-r
# http://ryouready.wordpress.com/2010/11/21/animate-gif-images-in-r-imagemagick/
#   see replies

library(animation)
saveGIF({
  ani.options(interval = 0.2, nmax = 10)
  t = seq(0,2*pi,.01)
  x = cos(2*t)*(cos(t)^2)
  y = sin(2*t)*(sin(t)^2)
  idx = seq(1,length(x),10)
  for (i in seq_along(idx)) {
    plot(x,y,type='n')
    points(x[seq(idx[i])],y[seq(idx[i])],pch=20,col='red')
    ani.pause()  ## pause for a while ('interval')
  }
}, interval = 0.05, movie.name = "comet_demo.gif", 
outdir = "/usr/temp",ani.width = 600, ani.height = 600)

animation option 'nmax' changed: 50 --> 10
I cannot find ImageMagick with convert = "convert"
animation option 'nmax' changed: 10 --> 50
NULL
Warning messages:
1: running command 'convert --version' had status 4 
2: In im.convert(img.files, output = movie.name, convert = convert,  :
   ImageMagick not installed yet!
   
