http://www.jose-gonzalez.org/merge-shapefile-set-encoding-r/?utm_source=rss&utm_medium=rss&utm_campaign=merge-shapefile-set-encoding-r#.VEXHkFZ-_8s

# How to merge a shapefile and set the encoding with R

### Load a shape file and merge it with a csv
### Author: Jose Gonzalez 
### www.jose-gonzalez.org

# This script shows how to load a shapefile, merge it with a csv and save it with the proper
# encoding

### Load rgdal

require(rgdal)

# Load csv
data  <- read.csv("myData.csv", fileEncoding="utf8", stringsAsFactors=F)

# Load shapefile using "UTF-8". Notice the "." is the directory and the shapefile name 
# has no extention
shp  <- readOGR(".", "myShapefile", stringsAsFactors=FALSE, encoding="UTF-8")
# Explore with a quick plot
plot(shp, axes=TRUE, border="gray")

# Merge shapefile and csv
temp  <- merge(shp, data, by.x="id", by.y="Code") 

# The shapefile behaves as a data.frame. Explore a bit
head(temp)

# Check your locale and set shapefile encoding to UTF-8
Sys.getlocale("LC_CTYPE")
getCPLConfigOption("SHAPE_ENCODING")
setCPLConfigOption("SHAPE_ENCODING", "UTF-8")

# Write merged shapefile using UTF-8
writeOGR(test, ".", "shp-merged", driver="ESRI Shapefile", layer_options= c(encoding= "UTF-8"),
         overwrite_layer=T)