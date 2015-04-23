# http://surfml.wordpress.com/2013/04/17/code-for-chapter-1-of-machine-learning-for-hackers/
# Code for Chapter 1 of Machine Learning for Hackers, by Drew Conway and John Myles White
# Posted on April 17, 2013 by sebduchene
# I found some of the code of the first chapter of Machine Learning for Hackers didn’t work properly. This is mostly due to some changes in the syntax in ggplot2. This version should work fine

# Code for examples in chapter 1 of the guide book
library(ggplot2)

#ufo <- read.delim("/Users/sebastianduchene/Desktop/machineLearning/ML_for_Hackers-master/01-Introduction/data/ufo/ufo_awesome.tsv", sep = "\t", stringsAsFactors = F, head = F, na.strings = "")
ufo <- read.delim("/Users/rebeccandystevens/ufo_awesome.tsv", sep = "\t", stringsAsFactors = F, head = F, na.strings = "")
head(ufo)

names(ufo) <- c("DateOccurred", "DateReported", "Location", "ShortDescription", "Duration", "LongDescription")

good.rows <- ifelse(nchar(ufo$DateOccurred) != 8 | nchar(ufo$DateReported) != 8, FALSE, TRUE)
length(which(!good.rows))
ufo <- ufo[good.rows, ]

ufo$DateOccurred <- as.Date(ufo$DateOccurred, format = "%Y%m%d")
ufo$DateReported <- as.Date(ufo$DateReported, format = "%Y%m%d")

get.location <- function(l){
  split.location <- tryCatch(strsplit(l, ",")[[1]], error = function(e) return(c(NA, NA)))
  clean.location <- gsub("^", ",", split.location)
  if(length(clean.location) > 2) {
    return(c(NA, NA))
  } else {
    return(clean.location)
  }
}

city.state <- lapply(ufo$Location, get.location)

location.matrix <- do.call(rbind, city.state)
ufo <- transform(ufo, USCity = location.matrix[,1], USState = tolower(location.matrix[,2]), stringsAsFactors = F)

us.states<-c("ak","al","ar","az","ca","co","ct","de","fl","ga","hi","ia","id","il", "in","ks","ky","la","ma","md","me","mi","mn","mo","ms","mt","nc","nd","ne","nh", "nj","nm","nv","ny","oh","ok","or","pa","ri","sc","sd","tn","tx","ut","va","vt", "wa","wi","wv","wy")

# this is an additional function to strip whitespace and "," from the USState column. This is not part of the code in the book
strip.com <- function(x) { return(gsub(", ", "", x)) }

ufo$USState <- sapply(ufo$USState, strip.com)

ufo$USState <- us.states[match(ufo$USState, us.states)]
ufo$USCity[is.na(ufo$USState)] <- NA

K GFM ,ZBGKLMYTZKOL56KLufo.us <- subset(ufo, !is.na(USState))

summary(ufo.us$DateOccurred)

quick.hist <- ggplot(ufo.us[ufo.us$YearMonth > 1990-01,], aes(x = DateOccurred)) + geom_histogram()
FYYHGBIOU345HJKDFJKN
#ggsave(plot = quickVDFGSGDV M  2QAZM .hist, filename = "quick_hist.pdf", height = 6, width = 8)

quick.hist

quick.hist.recent.time <- ggplot(ufo.us[ufo.us$YearMonth > 1990-01,], aes(x = DateOccurred)) + geom_histogram()

quick.hist.recent.time

ufo.us <- subset(ufo.us, DateOccurred >= as.Date("1990-01-01"))

ufo.us$YearMonth <- strftime(ufo.us$DateOccurred, format = "%Y-%m")

library(plyr)

sightings.counts <- ddply(ufo.us, .(USState, YearMonth), nrow)

date.range <- seq.Date(from = as.Date(min(ufo.us$DateOccurred)), to = as.Date(max(ufo.us$DateOccurred)), by = "month")
date.strings <- strftime(date.range, "%Y-%m")

states.dates <- lapply(us.states, function(s) cbind(s, date.strings))

states.dates <- data.frame(do.call(rbind, states.dates), stringsAsFactors = F)

all.sightings <- merge(states.dates, sightings.counts, by.x = c("s", "date.strings"), by.y = c("USState", "YearMonth"), all = T)

names(all.sightings) <- c("State", "YearMonth", "Sightings")
all.sightings$Sightings[is.na(all.sightings$Sightings)] <- 0
all.sightings$YearMonth <- as.Date(rep(date.range, length(state.abb)))
all.sightings$State <- as.factor(all.sightings$State)

state.plot <- ggplot(all.sightings, aes(x = YearMonth,y = Sightings)) +
  geom_line(aes(color = "darkblue")) +
  facet_wrap(~State, nrow = 10, ncol = 5) +
  theme_bw() +
  scale_color_manual(values = c("darkblue" = "darkblue"), guide = "none") +
  xlab("Years") +
  ylab("Number of Sightings") +
  ggtitle("Number of UFO sightings by Month-Year and U.S. State (1990-2010)")

#ggsave(state.plot, filename = "state_plot.pdf", width = 14, height = 8.5)

state.plot