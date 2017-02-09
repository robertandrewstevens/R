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

knnest(mlb[ , c(4, 6, 5)], c(72, 25), 20, scalefirst = FALSE) 

knnest <- function(xydata, regestpts, k) {
  require(FNN)
  if (is.vector(regestpts))
    regestpts <- matrix(regestpts, nrow = 1) 
  ycol <- ncol(xydata)
  x <- xydata[ , -ycol , drop = FALSE]

  print(str(x))
  print(class(x))
  colnames(regestpts) <- colnames(x)
  print(str(regestpts))
  print(class(regestpts))
  
  y <- xydata[ , ycol]
  print(class(y))
  if(!is.matrix(regestpts))
    regestpts <- matrix(regestpts, nrow = 1)
  print(class(regestpts))
  print(regestpts)
  tmp <- get.knnx(data = x, query = regestpts, k = k) 
  idx <- tmp$nn.index
  meannear <- function(idxrow) mean(y[idxrow]) 
  apply(idx, 1, meannear)
}

knnest(mlb[ , c(4, 6, 5)], c(72, 25), 20) 
