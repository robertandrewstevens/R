# http://www.johnmyleswhite.com/notebook/2010/09/23/higher-order-functions-in-r/
# Higher Order Functions in R
#
# Introduction
#
# Because R is, in part, a functional programming language, the ‘base’ package contains several higher order functions.
# By higher order functions, I mean functions that take another function as an argument and then do something with that function.
# If you want to know more about the usefulness of writing higher order functions in general, I’d recommend the classic 
# Structure and Interpretation of Computer Programs <http://mitpress.mit.edu/sicp/full-text/book/book.html> and the more recent
# Higher Order Perl <http://hop.perl.plover.com/book/>, both of which are freely available online.
#
# The six primary higher order functions built into R are
#
# 1. Reduce
# 2. Filter
# 3. Map
# 4. Find
# 5. Position
# 6. Negate
#
# I’ll go through these in order, giving some examples using basic number theoretic calculations in something approximating
# the style of SICP <http://mitpress.mit.edu/sicp/>. Hopefully the use of mathematical examples isn’t as unnerving for 
# stats-savvy readers as it can be for many readers of SICP.
#
# Reduce
#
# Reduce loops over pairs of elements of a vector, performing the same binary operation on all of the pairs along the way.
# That’s so abstract that it’s probably unclear. For that reason, I think it’s best to work up from a very specific example
# to the general notion of Reduce.
#
# Let’s start by assuming that you’ve been writing some horrible piece of code like the following:

my.sum <- function(x)
{
  if(length(x) == 1)
  {
    return(x[1])
  }
  if (length(x) == 2)
  {
    return(x[1] + x[2])
  }
  if (length(x) == 3)
  {
    return(x[1] + x[2] + x[3])
  }
}

my.sum(c(1:3))

# This approach is clearly so specific that it’s virtually unusable. The most obvious fault is that our code is unable to
# deal with arbitrarily long vectors. That can be easily fixed, though, with a simple loop:
  
my.sum <- function(x)
{
  result <- 0
  
  for (i in 1:length(x))
  {
    result <- result + x[i]
  }
  
  return(result)
}

my.sum(c(1:3))

# Reduce takes another abstraction step beyond the one we just made. Instead of making specific functions that repeatedly
# perform some set of pre-specified binary operations, Reduce provides one higher order generalization that takes an arbitrary
# binary operation as an argument. This lets us rewrite my.sum in one line:

my.sum <- function (x) {Reduce(`+`, x)}
my.sum(c(1:3))

# If you’re confused by that line, there are two potential sources of magic. First, the name of the addition operation in R
# is `+` with backquotes. Second, Reduce and its relatives assume that the first argument is a function that they will use on
# the elements of x.
#
# Once you realize that Reduce makes this sort of code trivial to write, it’s easy to continue exploiting this approach:

my.prod <- function (x) {Reduce(`*`, x)}
my.prod(c(1:3))

my.factorial <- function (n) {Reduce(`*`, 1:n)}
my.factorial(3)

# Better yet, if you know that Reduce has other options like accumulate, which allows you to keep track of the interim results
# of the Reduce operations, then you can also make replacements for cumsum and cumprod easily:

my.cumsum <- function (x) {Reduce(`+`, x, accumulate = TRUE)}
my.cumsum(c(1:3))

my.cumprod <- function (x) {Reduce(`*`, x, accumulate = TRUE)}
my.cumprod(c(1:3))

# Filter
# 
# Filter is even easier to understand than Reduce: it simply selects the elements of a vector that meet a predicate you pass
# in as a function:

small.even.numbers <- Filter(function (x) {x %% 2 == 0}, 1:10)
small.even.numbers

small.odd.numbers <- Filter(function (x) {x %% 2 == 1}, 1:10)
small.odd.numbers

# We can use Filter along with some more interesting predicates to write much more complex functions quickly:

is.divisor <- function(a, x) {x %% a == 0}
is.divisor(3, 6)

is.prime <- function (x) {length(Filter(function (a) {is.divisor(a, x)}, 1:x)) == 2}
is.prime(3)
is.prime(6)

# And we can even combine Reduce and Filter to perform otherwise tedious tasks like enumerating the perfect numbers:

proper.divisors <- function (x) {Filter(function (a) {is.divisor(a, x)}, 1:(x - 1))}
proper.divisors(6)

is.perfect <- function(x) {x == Reduce(`+`, proper.divisors(x))}
is.perfect(3)
is.perfect(6)

small.perfect.numbers <- Filter(is.perfect, 1:1000)
small.perfect.numbers

# Map
#
# Map is essentially the same abstraction as the apply family of functions provides. Try the following to see why I say that:

Map(proper.divisors, 1:5)

# Find
#
# Find is really a truncated form of Filter: it locates the first item in a vector that satisfies a predicate.
# For example, we can find the first prime greater than 1000 like so:

Find(is.prime, 1000:2000)

# Position
#
# Position is a variant of Find that provides the index of the element that would be returned by Find instead of its value:

Position(is.prime, 1000:2000)

# Negate
#
# Negate simply flips the Boolean sense of an existing predicate. So we can do the following:
  
is.composite <- Negate(is.prime)
is.composite(3)
is.composite(6)

# Using Reduce for Continued Fraction Computations
#
# The following example uses higher order functions to compute the value of a finite continued fraction.
# The code is lifted straight from the help docs for Reduce. If you’re not familiar with continued fractions,
# I’d recommend starting with this Wikipedia article <http://en.wikipedia.org/wiki/Continued_fraction> and then reading
# The Higher Arithmetic <http://www.amazon.com/Higher-Arithmetic-Introduction-Theory-Numbers/dp/0521634466>
# (Incidentally, The Higher Arithmetic is the most enjoyable book on mathematics I have ever read.)

cfrac <- function(x) Reduce(function(u, v) u + 1 / v, x, right = TRUE)
cfrac(c(1, rep(2, 99))) == sqrt(2)
## Continued fraction approximation for pi:
cfrac(c(3, 7, 15, 1, 292))
## Continued fraction approximation for Euler's number (e):
cfrac(c(2, 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8))

# This example also shows that you can have Reduce work right to left through a vector when you might need to.
# In this example, you do need to work in that specific order, because the binary operation is not associative,
# so moving left to right would produce different results.

# How Fast are These Higher Order Functions?
#
# Given their flexibility, one might wonder if these higher order functions lose something in efficiency.
# Some basic profiling suggests they do, though I think their elegance makes up for small efficiency losses in many contexts.
#
# For example, filtering and selecting elements of a vector are essentially identical, so we can compare these two approaches:

natural.numbers <- 1:10000
iterations <- 10

mean(replicate(iterations, system.time(natural.numbers[natural.numbers %% 2 == 0])))
mean(replicate(iterations, system.time(Filter(function (n) {n %% 2 == 0}, natural.numbers))))

# Similarly, we can compare Map and lapply:

mean(replicate(iterations, system.time(lapply(1:10000, sqrt))))
mean(replicate(iterations, system.time(Map(sqrt, 1:10000))))

# And finally we can compare our Reduce implementation of sum with the hardcoded one:

mean(replicate(iterations, system.time(sum(1:10000))))
mean(replicate(iterations, system.time(Reduce(`+`, 1:10000))))
