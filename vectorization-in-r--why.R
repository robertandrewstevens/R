# http://www.noamross.net/blog/2014/4/16/vectorization-in-r--why.html
# Vectorization in R: Why?
# by Noam Ross, 16 April 2014

# 1. What on earth is R actually doing?

i <- 5.0

i <- "foo"

2L + 3.5

fft

a <- c(1, 2, FALSE, "hello")
a
class(a)

c(1, 2, 3) + c(1, 2, 3)

# 2. Everything is a vector

# 3. Linear algebra is a special case

# 4. Functionals: Pre-allocating memory, avoiding side effects

j <- 1
j
for (i in 1:10) {
  j[i] = 10
}
j

j <- rep(NA, 10)
j
for (i in 1:10) {
  j[i] = 10
}
j

# So when might for loops make sense over vectorization?

# Some resources on vectorization

# Good discussion in a couple of blog posts by John Myles White.

# Some relevant chapters of Hadley Wickham’s Advanced R book: Functionals and code profiling

# Vectorization is covered in chapters 3 and 4 of the classic text on R’s idiosyncrasies - The R Inferno, by Patrick Burns

# Here are a bunch of assorted blog posts with good examples of speeding up code with vectorization
# http://www.r-bloggers.com/how-to-use-vectorization-to-streamline-simulations/
# http://nesterko.com/blog/2011/04/29/drastic-r-speed-ups-via-vectorization-and-bug-fixes/
# http://blog.revolutionanalytics.com/2014/04/a-look-a-r-vectorization-through-the-collatz-conjecture.html
# http://rpubs.com/daspringate/vectorisation
# http://quanttrader.info/public/FasterRCode.pdf