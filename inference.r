library(ggplot2)

# Read in the file resamp.r
source("http://www.public.iastate.edu/~hofmann/looking-at-data/code/resamp.r") 

# You should already have a copy of the data loaded into R. If not run this.
tips <- read.csv("tips.csv") 

head(tips)

# histograms
# Replace tips with sample from random normal with matching mean and 
# standard deviation
random_norm <- function(df) {
  transform(df, tip = rnorm(length(tip), mean(tip), sd(tip)))
}
samples <- resamp(tips, random_norm, 19, 4)

qplot(tip, data=samples, geom="histogram", xlab="Tips", ylab="Count",
      breaks=seq(0.55,10.55,0.1)) + 
  geom_histogram(fill="black",breaks=seq(0.55,10.55,0.1),ylim=c(0,45)) +
  facet_wrap(~ .n, ncol = 5) 

# scatterplot
tips_all <- resamp(tips, permute_var("tip"), n = 19, pos = 5)

qplot(totbill, tip, data=tips_all) + 
  geom_point(colour = alpha("black", 0.52), size = 1.8) +
  facet_wrap(~ .n, ncol = 5) + 
  xlab("bill") + ylab("tip") + opts(aspect.ratio = 1) 

