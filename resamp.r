# Basic resampling code
library(plyr)

resamp <- function(true, method, n = 19, pos = sample(n + 1, 1)) {
  samples <- rdply(n, method(true))
  if (missing(pos)) {
    message("True data in position ", pos)
  }
  add_true(samples, true, pos)
}

add_true <- function(samples, true, pos) {
  samples$.n <- with(samples, ifelse(.n >= pos, .n + 1, .n))
  true$.n <- pos
  
  all <- rbind.fill(samples, true)
  all[order(all$.n), ]
}

# Multivariate independence --------------------------------------------------
permute_var <- function(var) {
  function(df) {
    df[[var]] <- sample(df[[var]])
    df
  }
}


# Linear model as null -------------------------------------------------------
null_model <- function(f, ...) {
  function(df) {
    model <- eval(substitute(lm(formula, data = df), list(formula = f)))
    resp_var <- all.vars(f[[2]])

    resid <- resid_rotate(model)
    fitted <- predict(model)
    df[".resid"] <- resid
    df[".fitted"] <- fitted
    df[[resp_var]] <- fitted + resid
    df
  }
}


# Linear models --------------------------------------------------------------

rss <- function(model) sum(resid(model) ^ 2)
sigma <- function(model) summary(model)$sigma
n <- function(model) length(resid(model))

# rotation
resid_rotate <- function(model) {
  data <- model$model
  data[, 1] <- rnorm(nrow(data))

  rmodel <- update(model, data = data)
  resid(rmodel) * sqrt(rss(model) / rss(rmodel))
}

# parametric bootstrap
resid_pboot <- function(model) {
  rnorm(n = n(model), sd = sqrt(sigma(model)))  
}

