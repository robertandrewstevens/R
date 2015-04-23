library(ggplot2)

head(mpg)
str(mpg)
summary(mpg)

qplot(cty, hwy, data=mpg)
qplot(jitter(cty), jitter(hwy), data=mpg)

qplot(jitter(cty), jitter(hwy), data=mpg, colour=class)
qplot(jitter(cty), jitter(hwy), data=mpg, colour=cyl)

qplot(jitter(cty), jitter(hwy), data=mpg, colour=class,
      geom=c("point","smooth"), method="lm")

qplot(jitter(cty), jitter(hwy), data=mpg, facets = . ~ class)
qplot(jitter(cty), jitter(hwy), data=mpg, facets = class ~ drv,
      geom=c("point","smooth"), method="lm")

qplot(class, data=mpg, geom="bar")
qplot(cty, data=mpg, geom="histogram")
qplot(cty, data=mpg, geom="histogram", binwidth=2)

