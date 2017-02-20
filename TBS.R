TBS <- function(resp, pred, lambda) {
  Box.Cox <- function(y, lambda)
    if(lambda == 0) log(y) else (y^lambda - 1)/lambda
  if(abs(lambda) < sqrt(.Machine$double.eps))
    lambda <- 0
  value <- Box.Cox(resp, lambda) - Box.Cox(pred, lambda)
  if(!is.null(grad <- attr(pred, "gradient")))
    attr(value, "gradient") <- pred^(lambda - 1) * grad
  value
}
