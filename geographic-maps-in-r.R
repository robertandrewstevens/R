# http://blog.revolutionanalytics.com/2009/10/geographic-maps-in-r.html

library(maps)
map("state", interior = FALSE)
map("state", boundary = FALSE, col="gray", add = TRUE)

library(sp)
con <- url("http://gadm.org/data/rda/CHE_adm1.RData")
print(load(con))
close(con)

language <- c("german", "german", "german","german",
              "german","german","french", "french",
              "german","german","french", "french", 
              "german", "french","german","german",
              "german","german","german", "german",
              "german","italian","german","french",
              "french","german","german")
gadm$language <- as.factor(language)
col = rainbow(length(levels(gadm$language)))
spplot(gadm, "language", col.regions=col, main="Swiss Language Regions")


