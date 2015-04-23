# http://www.johnmyleswhite.com/notebook/2013/01/24/writing-better-statistical-programs-in-r/
# Writing Better Statistical Programs in R

# Vectorize Your Simulations

# Loop Code
run.sims <- function(n.sims)
{
  results <- data.frame()
  
  for (sim in 1:n.sims)
  {
    x <- rnorm(1, 0, 1)
    y1 <- runif(1, x, x + 1)
    y2 <- runif(1, x - 1, x)
    z <- rcauchy(1, y1 + y2, 1)
    results <- rbind(results, data.frame(X = x, Y1 = y1, Y2 = y2, Z = z))
  }
  
  return(results)
}

b <- Sys.time()
run.sims(5000)
e <- Sys.time()
e - b

# Vectorized Code
run.sims <- function(n.sims)
{
  x <- rnorm(n.sims, 0, 1)
  y1 <- runif(n.sims, x, x + 1)
  y2 <- runif(n.sims, x - 1, x)
  z <- rcauchy(n.sims, y, 1)
  results <- data.frame(X = x, Y1 = y1, Y2 = y2, Z = z)
  
  return(results)
}

b <- Sys.time()
run.sims(5000)
e <- Sys.time()
e - b


# The Data Generation / Model Fitting Cycle
# data <- generate(model, parameters)
# inferred.parameters <- fit(model, data)
# reliability <- error(model, parameters, inferred.parameters)

n.sims <- 100
n.obs <- 100

generate.normal <- function(parameters)
{
  return(rnorm(n.obs, parameters[1], parameters[2]))
}

fit.normal <- function(data)
{
  return(c(mean(data), sd(data)))
}

distance <- function(true.parameters, inferred.parameters)
{
  return((true.parameters - inferred.parameters)^2)
}

reliability <- data.frame()

for (sim in 1:n.sims)
{
  parameters <- c(runif(1), runif(1))
  data <- generate.normal(parameters)
  inferred.parameters <- fit.normal(data)
  recovery.error <- distance(parameters, inferred.parameters)
  reliability <- rbind(reliability,
                       data.frame(True1 = parameters[1],
                                  True2 = parameters[2],
                                  Inferred1 = inferred.parameters[1],
                                  Inferred2 = inferred.parameters[2],
                                  Error1 = recovery.error[1],
                                  Error2 = recovery.error[2]))
}
