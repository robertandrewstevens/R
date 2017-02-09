# Script:   demo.R
# Author:   Robert A. Stevens
# Date:     04/22/15
# Purpose:  understand, explore, and learn from demos distributed with R

demo()

# Demos in package ‘base’:

# error.catching
# More examples on catching and handling errors
demo(error.catching)

# is.things               
# Explore some properties of R objects and
# is.FOO() functions. Not for newbies!
demo(is.things)

# recursion
# Using recursion for adaptive integration
demo(recursion)

# scoping                 
# An illustration of lexical scoping.
demo(scoping)

Demos in package ‘graphics’:
  
  Hershey                 Tables of the characters in the Hershey vector
fonts
Japanese                Tables of the Japanese characters in the
Hershey vector fonts
graphics                A show of some of R's graphics capabilities
image                   The image-like graphics builtins of R
persp                   Extended persp() examples
plotmath                Examples of the use of mathematics annotation

Demos in package ‘grDevices’:

colors                  A show of R's predefined colors()
hclColors               Exploration of hcl() space

Demos in package ‘stats’:

glm.vr                  Some glm() examples from V&R with several
                        predictors
lm.glm                  Some linear and generalized linear modelling
                        examples from `An Introduction to Statistical
                        Modelling' by Annette Dobson
nlm                     Nonlinear least-squares using nlm()
smooth                  `Visualize' steps in Tukey's smoothers


Use ‘demo(package = .packages(all.available = TRUE))’
to list the demos in all *available* packages.
