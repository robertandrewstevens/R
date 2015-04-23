# http://blog.revolutionanalytics.com/2009/11/choropleth-challenge-result.html (article and partial code)
# https://gist.github.com/233134/2e69918c06b225c91ce1b8cbe055d6b1d9fe2ad3 (complete code and data link)
# data: http://datasets.flowingdata.com/unemployment09.csv

library(ggplot2)
library(maps)

# First (and most annoying) task - get matching state and county variables 
# for both datasets.  And unfortauntely it's not quite right, as you can
# see from the finish product - some counties are missing.
unemp <- read.csv("unemployment09.csv", header = F, stringsAsFactors = F)
names(unemp) <- c("id", "state_fips", "county_fips", "name", "year", 
                  "?", "?", "?", "rate")
unemp$county <- tolower(gsub(" County, [A-Z]{2}", "", unemp$name))
unemp$state <- gsub("^.*([A-Z]{2}).*$", "\\1", unemp$name)

county_df <- map_data("county")
names(county_df) <- c("long", "lat", "group", "order", "state_name", "county")
county_df$state <- state.abb[match(county_df$state_name, tolower(state.name))]
county_df$state_name <- NULL

state_df <- map_data("state")

# Combine together 
choropleth <- merge(county_df, unemp, by = c("state", "county"))
choropleth <- choropleth[order(choropleth$order), ]
# Discretise rate to use with Brewer colour scheme - many options here
# choropleth$rate_d <- cut_number(choropleth$rate, 5)
# choropleth$rate_d <- cut_interval(choropleth$rate, 5)
# Nathan's choice is a little odd:
choropleth$rate_d <- cut(choropleth$rate, breaks = c(seq(0, 10, by = 2), 35))

# Once you have the data in the right format, recreating the plot is straight
# forward.

ggplot(choropleth, aes(long, lat, group = group)) +
  geom_polygon(aes(fill = rate_d), colour = alpha("white", 1/2), size = 0.2) + 
  geom_polygon(data = state_df, colour = "white", fill = NA) +
  scale_fill_brewer(pal = "PuRd")

# Takes a while to draw because ggplot2 not very efficient with large numbers
# of polygons :(