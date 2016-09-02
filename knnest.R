# arguments:
# 
# xydata: matrix or data frame of full (X, Y) data, Y in last column
# regestpts: matrix or data frame of X vectors at which to estimate 
#            the regression function
# k: number of nearest neighbors 
# scalefirst: call scale() on the data first 
#
# value: estimated regression function at the given X values

knnest <- function(xydata, regestpts, k, scalefirst = FALSE) {
  require(FNN)
  if (is.vector(regestpts))
    regestpts <- matrix(regestpts, nrow = 1) 
  ycol <- ncol(xydata)
  x <- xydata[ , -ycol , drop = FALSE]
  if(scalefirst) {
    tmp <- rbind(x, regestpts) 
    tmp <- scale(tmp)
    x <- tmp[1:nrow(x), ]
    regestpts <- tmp[(nrow(x) + 1):nrow(tmp), ] 
  }
  colnames(regestpts) <- colnames(x) 
  y <- xydata[ , ycol]
  if(!is.matrix(regestpts))
    regestpts <- matrix(regestpts, nrow = 1)
  tmp <- get.knnx(data = x, query = regestpts, k = k) 
  idx <- tmp$nn.index
  meannear <- function(idxrow) mean(y[idxrow]) 
  apply(idx, 1, meannear)
}