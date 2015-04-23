library(rggobi)

x <- data.frame(v1=rnorm(50),v2=rnorm(50),v3=rnorm(50))
g <- ggobi(x)

gcolor <- c(rep(9,10),rep(1,40))
glyph_color(g[1]) <- gcolor

gd <-g[1]
gd[, "v1"]
gd[, "v1"] <- rexp(50)

