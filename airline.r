library(ggplot2)

# don't worry, if this fails - that is only necessary for DB access
install.packages("DBI", type="source")
install.packages("RMySQL", type="source")
# for help with the installation see
#    http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL

co <- dbConnect(dbDriver("MySQL"), user="2009Expo", password="R R0cks", port=3306, dbname="data_expo_2009", host="headnode.stat.iastate.edu")

dbGetQuery(co, "select * from ontime limit 10")

###############

states <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/states.csv")
head(states)

qplot(x,y, data=states)
qplot(x,y, data=states, geom="path")
qplot(x,y, data=states, geom="polygon")

###############
# Your turn
map <- geom_polygon(aes(x,y), data=states, fill="grey70")

airports <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/airports.csv")

# first attempt
ggplot() + map + geom_point(aes(longitude, latitude), data=airports)
# filtering to mainland only
mainland <- subset(airports, (longitude < max(states$x, na.rm=T)) & 
							 (longitude > min(states$x, na.rm=T)) & 
                             (latitude < max(states$y, na.rm=T)) &
                             (latitude > min(states$y, na.rm=T)) )
ggplot() + map + geom_point(aes(longitude, latitude), data=mainland)
ggplot() + map + geom_point(aes(longitude, latitude, size=Volume), colour="grey50", data=mainland)

################
# making maps look like maps
theme_nothing <- opts(axis.title.x=theme_blank(), # remove x and y label 
 axis.title.y=theme_blank(), 
 axis.line=theme_blank(), # no axis at the bottom and the left
 axis.ticks=theme_blank(), # don’t show ticks
 axis.text.y = theme_blank(), # no tick marks
 axis.text.x = theme_blank(),

 panel.grid.minor=theme_blank(), # don’t show any gridlines 
 panel.grid.major=theme_blank(), 
 panel.background=theme_blank(), # invisible background
 panel.border = theme_blank(), # no border around plot space
 panel.margin = unit(0, "lines")
) 

ggplot() + map + geom_point(aes(longitude, latitude, size=Volume), colour="grey50", data=mainland) + theme_nothing


################
# add flights

flights <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/mar13.csv")

inFlight <- function(dataset, tp, x) {
	# tp is time point (in hhmm notation)
	# x is interval (in minutes)

	# use actual departure and arrival times
	subset(dataset, (DepTime <= tp+x) & (ArrTime >= tp))[,c("DepTime", "ArrTime", "Origin", "Dest")]
}

flightXY <- function(record, tp) {
	minutes <- function(hhmm) {
		hhmm %/% 100 *60 + hhmm %% 100
	}
	# record consists of departure, arrival times, origin and destination
	
	loc_orig <- merge(record, airports, by.x="Origin", by.y="iata")[, c("longitude", "latitude")]
	loc_dest <- merge(record, airports, by.x="Dest", by.y="iata")[, c("longitude", "latitude")]

	airtime <- minutes(record$ArrTime - record$DepTime)
	percflown <- minutes(tp - record$DepTime)/airtime

	# linear interpolation	
	loc_orig + percflown*(loc_dest - loc_orig)
}

flightXY(inFlight(flights, 800, 2), 800)

qplot(longitude, latitude, data=flightXY(inFlight(flights, 800, 2), 800))

ggplot() + map + geom_point(aes(longitude, latitude, size=Volume), colour="grey50", data=mainland) + 
  geom_point(aes(longitude, latitude), data=flightXY(inFlight(flights, 800, 2), 800), size=1) + 
  xlim(c(-130,-60)) + ylim(c(25, 50))


for (i in seq(800, 858, by=2)) {
	ggplot() + map + geom_point(aes(longitude, latitude, size=Volume), colour="grey50", data=mainland) + 
  geom_point(aes(longitude, latitude), data=flightXY(inFlight(flights, i, 2), i), size=1) + 
  xlim(c(-130,-60)) + ylim(c(25, 50))
  ggsave(sprintf("map-%d.pdf",i))
}

#########################
# install.packages("RgoogleMaps")

library(RgoogleMaps)
library(ReadImages)
# google maps and satellite images as background

source("http://www.public.iastate.edu/~hofmann/looking-at-data/code/ggooglemaps.R")

# get satellite image for the affected area
map_center <- c(lon=-95.6, lat=38.2)
sat_map <-ggooglemap(center = map_center, zoom = 4, maptype='satellite', n_pix=640)

head(sat_map)
################
# geom tile

x <- rep(1:4, each=4)
y <- rep(1:4, 4)
z <- rnorm(16)

qplot(x,y, fill=z, geom="tile")

###############
# upper quartile:
qplot(lon, lat, data = subset(sat_map, (lat >= 48) & (lon >= -81)) , geom = 'tile', fill = fill) +
  scale_fill_identity(legend=F) +
  scale_x_continuous('Longitude') + 
  scale_y_continuous('Latitude') +  
  coord_equal() + theme_nothing()

# 2 min rendering time
satmap <- ggplot() + geom_tile(aes(lon, lat, fill = fill), data = sat_map) +
  scale_fill_identity(legend=F) +       # fill variable consists of color names
  scale_x_continuous('Longitude') +     # x label
  scale_y_continuous('Latitude') +      # y label
  coord_equal() +                       # aspect ratio
  theme_nothing()                       # map options

satmap

# adding to satellite images

satmap + geom_point(aes(longitude, latitude, size=Volume), colour="orange", data=mainland)

satmap + 
	geom_point(aes(longitude, latitude, size=Volume), colour="orange", data=mainland) + 
	geom_point(aes(longitude, latitude), data=flightXY(inFlight(flights, 800, 2), 800),  
	   colour="white", size=1) + 
    xlim(c(-130,-60)) + ylim(c(25, 50))
    
ggsave(filename="tp-800.pdf")