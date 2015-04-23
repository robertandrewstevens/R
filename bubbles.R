# https://gist.github.com/233134/2e69918c06b225c91ce1b8cbe055d6b1d9fe2ad3

library(ggplot2)

mid_range <- function(x) mean(range(x, na.rm = TRUE))
centres <- ddply(county_df, c("state", "county"), summarise, 
                 lat = mid_range(lat), 
                 long = mid_range(long)
)

bubbles <- merge(centres, unemp, by = c("state", "county"))
ggplot(bubbles, aes(long, lat)) +
  geom_polygon(aes(group = group), data = state_df, colour = "white", fill = NA) +
  geom_point(aes(size = rate), alpha = 1/2) +
  scale_area(to = c(0.5, 3), breaks = c(5, 10, 20, 30))