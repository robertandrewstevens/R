# http://metvurst.wordpress.com/2014/04/18/reot-empirical-orthogonal-teleconnections-in-r-2/
# Reot: Empirical Orthogonal Teleconnections in R

library("rworldmap")
library("rgdal")
library("rgeos")
library("latticeExtra")
library("gridExtra")
#library("Reot")
library("remote") # replaced "Reot" on CRAN

### load the necessary data
data("vdendool")
data("coastsCoarse")

### calculate the first four EOT modes
modes <- eot(pred = vdendool, resp = NULL, n = 4, 
             reduce.both = FALSE, standardised = FALSE, 
             print.console = TRUE)

## Calculating linear model ... 
## Locating 1. EOT ...
## Location: -35 77.67 
## Cum. expl. variance (%): 21.53 
## 
## Calculating linear model ... 
## Locating 2. EOT ...
## Location: -165 43.15 
## Cum. expl. variance (%): 38.17 
## 
## Calculating linear model ... 
## Locating 3. EOT ...
## Location: 85 67.81 
## Cum. expl. variance (%): 46.08 
## 
## Calculating linear model ... 
## Locating 4. EOT ...
## Location: -25 53.01 
## Cum. expl. variance (%): 53.07

### set appropriate projection
ster <- CRS("+proj=stere +lat_0=90 +lon_0=-45")

xmin <- -180
xmax <- 180
ymin <- 20
ymax <- 90     # Coordinates for bounding box
bb <- cbind(x = c(xmin, xmin, xmax, xmax, xmin), 
            y = c(ymin, ymax, ymax, ymin, ymin))
SP <- SpatialPolygons(list(Polygons(list(Polygon(bb)), "1")), 
                      proj4string = CRS(proj4string(coastsCoarse)))

gI <- gIntersects(coastsCoarse, SP, byid = TRUE) 
out <- vector(mode = "list", length = length(which(gI))) 
ii <- 1

for (i in seq(along = gI)) if (gI[i]) {
  out[[ii]] <- gIntersection(coastsCoarse[i, ], SP)
  row.names(out[[ii]]) <- row.names(coastsCoarse)[i]
  ii <- ii + 1
}

nhem.coasts <- do.call("rbind", out)
nhem.coasts.ster <- spTransform(nhem.coasts, ster) 

lout <- list("sp.lines", nhem.coasts.ster, 
             col = "grey30", grid = TRUE)

### define colors
clrs <- colorRampPalette(rev(brewer.pal(9, "RdBu")))

### re-project modes
mode <- lapply(seq(modes), function(i) {
  projectRaster(modes[[i]]$r.predictor, crs = ster)
})

### create title for each image
titles <- lapply(seq(mode), function(i) {
  paste("Mode ", i, " : ", "EV = ", 
        round(if (i > 1) {
          modes[[i]]$exp.var * 100 - 
            modes[[i - 1]]$exp.var * 100
        } else {
          modes[[i]]$exp.var * 100
        }, 1), " : ", "BP = ", 
        as.integer(modes[[i]]$loc.eot[, 1]), 
        ", ", as.integer(modes[[i]]$loc.eot[, 2]), 
        sep = "")
})

### create plots
p <- lapply(seq(mode), function(i) {
  spplot(mode[[i]], sp.layout = lout, 
         main = list(titles[[i]], cex = 0.7),
         col.regions = clrs(1000), at = seq(-1, 1, 0.2),
         par.settings = list(axis.line = list(col = 0)),
         colorkey = list(height = 0.75, width = 1))
})

### arrange and plot
f <- function(...) grid.arrange(..., heights = 1, ncol = 2)
do.call(f, p)
