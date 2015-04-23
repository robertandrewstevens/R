tips <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/tips.csv")

# examine object

# first few values
head(tips)

# structure of object
str(tips)

# dimension of the object
dim(tips)

# summary of the object
summary(tips)


help("read.csv")
help("readcsv")
apropos("read")
#############################
# Extracting Parts

tips$sex
tips[,c("sex", "smoker")]
tips[1:10,]		# compare to head(tips)
tips[1:10, c("tip", "day")]
tips$tip[1:10]

#############################
# Graphical overviews

install.packages("ggplot2")	# only once on a machine, or for updates
library(ggplot2) # every session

qplot(totbill, tip, geom="point", data=tips)
qplot(totbill, tip, geom="point", data=tips) + geom_smooth(method="lm")

# make new variable
tips$tipperc <- tips$tip/tips$totbill*100

# one dimensional
qplot(tip, geom="histogram", data=tips)
qplot(tip, geom="histogram", binwidth=10, data=tips)
qplot(tip, geom="histogram", binwidth=5, data=tips)
qplot(tip, geom="histogram", binwidth=2, data=tips)
qplot(tip, geom="histogram", binwidth=0.1, data=tips)

# boxplots of tiprate by smoker, sex and the interaction
qplot(sex, tipperc, geom="boxplot", data=tips)
qplot(smoker, tipperc, geom="boxplot", data=tips)
qplot(sex:smoker, tipperc, geom="boxplot", data=tips)

# scatterplots, by smoker and sex
qplot(totbill, tip, geom="point", facets=smoker~sex, data=tips) + geom_smooth(method="lm")

# do tips decrease with increasing party size?
qplot(size, tipperc, geom="point", facets=smoker~sex, data=tips) + geom_smooth(method="lm")

# your turn results
qplot(totbill, geom="histogram", data=tips, binwidth=1)
# idea: come up with binary variable: rounded overall vs not rounded
tips$rounded <- with(tips, round(totbill+tip,0) ==totbill+tip)
qplot(totbill, geom="histogram", data=tips, binwidth=1, fill=rounded)
table(tips$rounded)/nrow(tips)
# 'round' values by chance happen with prob 0.01

qplot(day:sex, tip, geom="boxplot", data=tips)

