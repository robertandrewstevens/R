# http://oddhypothesis.blogspot.com/2014/08/optimizing-with-r-expressions.html
# Optimizing with R expressions
# by Lee Pang, 2014/08/20

# The all.vars() function extracts all variable and parameter names from an expression as a character vector.
# For example:
all.vars(expression(b1 + (b0 - b1)*exp(-k*x) + b2*x))

# The D() function takes two arguments: an expression to differentiate and a character specifying the variable 
# term to differentiate by:
D(expression(b1 + (b0 - b1)*exp(-k*x) + b2*x), 'x')

# The following code produces a list of the partial derivatives of the above equation with respect to each 
# variable/parameter.

# the model equation
expr <- expression(
  (K*y0*exp(u*(x - tl)))/(K + y0*(exp(u*(x - tl)) - 1)) + b1 + (b0 - b1)*exp(-k*x) + b2*x
)

sapply(all.vars(expr), function(v){
  D(expr, v)
})

# Each element of the list returned by the sapply() statement above is itself an expression. 
# Evaluation of each will give rows of the Jacobian matrix, which we’ll subsequently need to compute the gradient:
  
p0 <- c(y0 = 0.01, u = 0.3, tl = 5, K = 2, b0 = 0.01, b1 = 1, b2 = 0.001, k = 0.1)
x <- seq(0,10)

# notice that t() is applied to put parameters on rows
J <- t(sapply(all.vars(expr), function(v, env) {eval(D(expr, v), env)}, 
       env = c(as.list(p0), list(x = x))))
J

# Since x is the independent variable, the row corresponding to it can be safely removed from the Jacobian:

J <- J[names(p0), , drop = FALSE]
J

# The gradient vector is simply the inner product of the Jacobian and a vector of residuals:
# gr <- -J %*% r

# The equivalent R code would be:
H <- J %*% t(J)
H

# Putting it all together:

# the model equation
expr <- expression(
  (K*y0*exp(u*(x - tl)))/(K + y0*(exp(u*(x - tl)) - 1)) + b1 + (b0 - b1)*exp(-k*x) + b2*x
)

p0 <- c(y0 = 0.01, u = 0.3, tl = 5, K = 2, b0 = 0.01, b1 = 1, b2 = 0.001, k = 0.1)
x <- seq(0, 48, by = 0.25)

# let's say these are the residuals
r <- runif(length(x))

# magic syntax that converts an equation expression into a jacobian matrix
J <- t(sapply(all.vars(expr), function(v, env) {eval(D(expr, v), env)}, 
       env = c(as.list(p0), list(x = x))))

# and then a gradient vector
gr <- -J %*% r

# and then an approximate Hessian matrix
H <- J %*% t(J)

# Extending this further, one can now write a generic model object like so:

ModelObject = setRefClass('ModelObject', 
                          fields = list(
                            name = 'character',
                            expr = 'expression'
                          ),
                          methods = list(
                            value = function(p, data){
                              eval(.self$expr, c(as.list(p), as.list(data)))
                            },
                            jacobian = function(p, data){
                              J = t(sapply(all.vars(.self$expr), function(v, p, data){
                                eval(D(.self$expr, v), c(as.list(p), as.list(data)))
                              }, p=p, data=data))
                              
                              return(J[names(p),,drop=F])
                            },
                            gradient = function(p, data){
                              r = data$y - value(p, data)
                              return(-jacobian(p, data) %*% r)
                            },
                            hessian = function(p, data){
                              J = jacobian(p, data)
                              return(J %*% t(J))
                            }
                          )
)

# which is instantiated with simply an expression and can be used to provide gradient and Hessian functions to nlminb():
  
xy <- list(x = seq(0, 10, by = 0.25), y = dnorm(seq(0, 10, by = 0.25), 10, 2)) # test data
p0 <- c(y0 = 0.01, u = 0.2, l = 5, A = log(1.5/0.01))
mo = ModelObject(
  name = 'gompertz', 
  expr = expression(y0*exp(A*exp(-exp((u*exp(1)/A)*(l - x) + 1))))
)

fit <- nlminb(p0, function(p, data) {
  r = data$y - mo$value(p,data)
  return(r %*% r)
}, gradient = mo$gradient, hessian = mo$hessian, data = xy)

fit$par

fit$message

plot(xy, main = 'Fit Results')
lines(xy$x, mo$value(fit$par, xy))
