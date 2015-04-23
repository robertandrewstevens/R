library(ggplot2)

# NOAA data
# download file from 
# http://www.public.iastate.edu/~hofmann/looking-at-data/data/noaa.rdata
load("noaa.rdata")
# creates data frames gliders, floats, boats and rig in the working space
ls()

# working directories
getwd() # shows path to working directory
setwd() # sets new working directory 
# on the Mac: CMD-d


# locations of boats, floats, and gliders
# floats is the smallest object (should give you the least trouble)
qplot(Longitude, Latitude, colour=callSign, data=floats)
qplot(Longitude, Latitude, colour=callSign, data=boats)
qplot(Longitude, Latitude, colour=callSign, data=gliders)

# include spatial context:
# add symbol for rig on top of floats

# Caution! common problem:
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
	geom_point(aes(x, y), shape="x", data=rig)
Error in eval(expr, envir, enclos) : object 'callSign' not found

# 'break' connection between data sets by turning inheritance off
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
	geom_point(aes(x, y), shape="x", data=rig, inherit.aes=FALSE)
	
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
	geom_point(aes(x, y), shape="x", size=5, data=rig, inherit.aes=FALSE)
	
qplot(Longitude, Latitude, colour=callSign, data=floats) + 
 	geom_point(aes(x, y), shape="x", size=5, data=rig, inherit.aes=FALSE) + 
 	geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1, inherit.aes=FALSE)

####
# qplot vs ggplot

qplot(Longitude, Latitude, colour=callSign, data=floats)

ggplot(data=floats, aes(x=Longitude, y=Latitude, colour=callSign)) +
	geom_point() + 
	scale_x_continuous() + 
	scale_y_continuous() + 
	scale_colour_discrete ()

			
	qplot(Longitude, Latitude, colour=callSign, data=floats)

# But we don't need to be quite so verbose.  Scales are
# added automatically and first two aes params are x and y:
ggplot(floats, aes(Longitude, Latitude, colour = callSign)) + 
    geom_point()
    
# Temperature by callSign
qplot(callSign, Temperature, data=floats, geom=c("jitter", "boxplot"))

ggplot(floats, aes(callSign, Temperature)) + 
    geom_jitter() + 
    geom_boxplot()
    
# Your Turn

qplot(Depth, Temperature, colour=callSign, data=floats)   

#########
# including maps

# install.packages("maps")  # if you do not have the maps package
library(maps)
states <- map_data("state")
head(states)

ggplot() + 	# plot without a default data set
 geom_path(data=states, aes(x=long, y=lat, group=group)) + 
 geom_point(data=floats, aes(x=Longitude, y=Latitude, colour=callSign)) +   
 geom_point(aes(x, y), shape="x", size=5, data=rig) + 
 geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
 xlim(c(-91, -80)) + 
 ylim(c(22,32))

# save map layer:
map <- geom_path(data=states, aes(x=long, y=lat, group=group))

#########
# your turn

animals <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/animal.csv")
head(animals)
qplot(Longitude, Latitude, data=animals)
qplot(Longitude, Latitude, data=animals, colour=class)
qplot(Longitude, Latitude, data=subset(animals, Alive=="N"), colour=class)
# just the layer:
sightings <- geom_point(aes(Longitude, Latitude, colour=class), data=subset(animals, Alive=="N"))

# as ggplot statement:
ggplot() + sightings

# add map and crop:
ggplot() + map + sightings + 
  geom_point(aes(x, y), shape="x", size=5, data=rig) + 
  geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
  xlim(c(-98, -80)) + 
  ylim(c(24,33))

levels(animals$class)
levels(animals$class) <- c("Birds", "Mammals", "Reptiles")

# indicate time - make use of Date variable
# install.packages("lubridate")
library(lubridate)

animals$Date <- as.Date(animals$Date)
sightings <- geom_point(aes(Longitude, Latitude, colour=as.numeric(Date), shape=class), data=subset(animals, Alive=="N")) 

ggplot() + map + sightings + 
  scale_colour_gradient() +
  geom_point(aes(x, y), shape="x", size=5, data=rig) + 
  geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
  xlim(c(-98, -80)) + 
  ylim(c(24,33))

sightings <- geom_point(aes(Longitude, Latitude, colour=month(Date), shape=class), data=subset(animals, Alive=="N")) 

ggplot() + map + sightings + 
  geom_point(aes(x, y), shape="x", size=5, data=rig) + 
  geom_text(aes(x, y), label="BP Oil rig", shape="x", size=5, data=rig, hjust = -0.1) + 
  xlim(c(-98, -80)) + 
  ylim(c(24,33))

#################
