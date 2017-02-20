con <- function(x, y) {
  tab <- table(x, y)
  print(tab)
  diag(tab) <- 0
  cat("error rate = ", round((100 * sum(tab))/length(x), 2), "%\n")
  invisible()
}