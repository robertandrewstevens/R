tree.size <- function(x) {
  set.seed(123)
  cv <- cv.tree(x,  , prune.tree)
  for(i in 2:5)
    cv$dev <- cv$dev + cv.tree(x,  , prune.tree)$dev
  cv$dev <- cv$dev/5
  cat("Optimal Size = ", cv$size[match(min(cv$dev), cv$dev)], "\n")
  cv
}