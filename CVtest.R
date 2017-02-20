CVtest <- function(fitfn, predfn, ...) {
  res <- fgl$type
  for(i in sort(unique(rand))) {
    cat("fold ", i, "\n", sep = "")
    learn <- fitfn(rand != i, ...)
    res[rand == i] <- predfn(learn, rand == i)
  }
  res
}