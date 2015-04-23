# http://stackoverflow.com/questions/10748253/idiomatic-r-code-for-partitioning-a-vector-by-an-index-and-performing-an-operati
# Idiomatic R code for partitioning a vector by an index and performing an operation on that partition
#
# I'm trying to find the idiomatic way in R to partition a numerical vector by some index vector, find the sum of all numbers
# in that partition and then divide each individual entry by that partition sum. In other words, if I start with this:

df <- data.frame(x = c(1,2,3,4,5,6), index = c('a', 'a', 'b', 'b', 'c', 'c'))
df

# I want the output to create a vector (let's call it z):
  
c(1/(1+2), 2/(1+2), 3/(3+4), 3/(3+4), 5/(5+6), 6/(5+6))  

# If I were doing this is SQL and could use window functions, I would do this:
#  
#  select 
#    x / sum(x) over (partition by index) as z 
#  from df
#
# and if I were using plyr, I would do something like this:

library(plyr)
ddply(df, .(index), transform, z = x / sum(x))

# but I'd like to know how to do it using the standard R functional programming tools like mapply/aggregate etc.


# Yet another option is ave. For good measure, I've collected the answers above, tried my best to make their output equivalent
# (a vector), and provided timings over 1000 runs using your example data as an input. First, my answer using ave:
#
#   ave(df$x, df$index, FUN = function(z) z/sum(z))
#
# I also show an example using data.table package since it is usually pretty quick, but I know you're looking for base solutions,
# so you can ignore that if you want.
#
# And now a bunch of timings:
  
library(data.table)
library(plyr)
dt <- data.table(df)

plyr <- function() ddply(df, .(index), transform, z = x / sum(x))
av <- function() ave(df$x, df$index, FUN = function(z) z/sum(z))
t.apply <- function() unlist(tapply(df$x, df$index, function(x) x/sum(x)))
l.apply <- function() unlist(lapply(split(df$x, df$index), function(x){x/sum(x)}))
b.y <- function() unlist(by(df$x, df$index, function(x){x/sum(x)}))
agg <- function() aggregate(df$x, list(df$index), function(x){x/sum(x)})
d.t <- function() dt[, x/sum(x), by = index]

library(rbenchmark)
benchmark(plyr(), av(), t.apply(), l.apply(), b.y(), agg(), d.t(), 
          replications = 1000, 
          columns = c("test", "elapsed", "relative"),
          order = "elapsed")

# the lapply() solution seems to win in this case and data.table() is surprisingly slow.
# Let's see how this scales to a bigger aggregation problem:

df <- data.frame(x = sample(1:100, 1e5, TRUE), index = gl(1000, 100))
dt <- data.table(df)

# Replication code omitted for brevity, used 100 replications and dropped plyr() since I know it 
# will be slow by comparison:

benchmark(plyr(), av(), t.apply(), l.apply(), b.y(), agg(), d.t(), 
          replications = 1000, 
          columns = c("test", "elapsed", "relative"),
          order = "elapsed")

# took too long to finish
# test elapsed  relative
# 6     d.t()   2.052  1.000000
# 1      av()   2.401  1.170078
# 3 l.apply()   4.660  2.270955
# 2 t.apply()   9.500  4.629630
# 4     b.y()  16.329  7.957602
# 5     agg()  20.541 10.010234

# that seems more consistent with what I'd expect.
#
# In summary, you've got plenty of good options. Find one or two methods that work with your mental model of how aggregation tasks should work and master that function. Many ways to skin a cat.

# Edit - and an example with 1e7 rows
# Probably not large enough for Matt, but as big as my laptop can handle without crashing:
  
df <- data.frame(x = sample(1:100, 1e7, TRUE), index = gl(10000, 1000))
dt <- data.table(df)

benchmark(plyr(), av(), t.apply(), l.apply(), b.y(), agg(), d.t(), 
          replications = 1000, 
          columns = c("test", "elapsed", "relative"),
          order = "elapsed")

# took too long to finish?
# test elapsed  relative
# 6     d.t()    0.61  1.000000
# 1      av()    1.45  2.377049
# 3 l.apply()    4.61  7.557377
# 2 t.apply()    8.80 14.426230
# 4     b.y()    8.92 14.622951
# 5     agg()   18.20 29.83606


# If you're only operating on a single vector and only need a single indexing vector then tapply is quite fast

dat <- 1:6
lev <- rep(1:3, each = 2)
tapply(dat, lev, function(x){x/sum(x)})
unlist(tapply(dat, lev, function(x){x/sum(x)}))


# Three other approaches as well:

dat <- 1:6
lev <- rep(1:3, each = 2)
lapply(split(dat, lev), function(x){x/sum(x)})
by(dat, lev, function(x){x/sum(x)})
aggregate(dat, list(lev), function(x){x/sum(x)})
