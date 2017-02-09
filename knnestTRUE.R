library(FNN)

xydata <- mlb[ , c(4, 6, 5)]
regestpts <- c(72, 25)
k <- 20
scalefirst <- TRUE 

head(xydata)
regestpts
k
scalefirst

is.vector(regestpts)
if(is.vector(regestpts))
  regestpts <- matrix(regestpts, nrow = 1) 
is.vector(regestpts)
is.matrix(regestpts)

ycol <- ncol(xydata)
ycol
  
x <- xydata[ , -ycol , drop = FALSE]
head(x)

class(x)
class(regestpts)

str(x)
str(regestpts)
regestpts <- as.data.frame(regestpts)
class(regestpts)
str(regestpts)

names(regestpts) <- names(x)
str(regestpts)

tmp <- rbind(x, regestpts) 
str(tmp)
tail(tmp)

tmp <- scale(tmp)
str(tmp)
tail(tmp)

x <- tmp[1:nrow(x), ]
regestpts <- tmp[(nrow(x) + 1):nrow(tmp), ] 
regestpts

dim(x)
dim(regestpts)
class(regestpts)
regestpts <- as.data.frame(t(regestpts))
regestpts
dim(regestpts)
class(regestpts)

colnames(regestpts) <- colnames(x) 
y <- xydata[ , ycol]
if(!is.matrix(regestpts))
  regestpts <- matrix(regestpts, nrow = 1)
class(regestpts)
class(x)
head(x)
regestpts
k
dim(y)
class(y)
y <- as.numeric(y)
summary(y)
summary(x)
summary(regestpts)

tmp <- get.knnx(data = x, query = regestpts, k = k) 
idx <- tmp$nn.index
meannear <- function(idxrow) mean(y[idxrow]) 
apply(idx, 1, meannear)


  
  
  knnest <- function(xydata, regestpts, k, scalefirst = FALSE) {
    require(FNN)
    if (is.vector(regestpts))
      regestpts <- matrix(regestpts, nrow = 1) 
    ycol <- ncol(xydata)
    x <- xydata[ , -ycol , drop = FALSE]
    if(scalefirst) {
      regestpts1 <- as.data.frame(regestpts)
      names(regestpts1) <- names(x)
      tmp <- rbind(x, regestpts1) 
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
  
  knnest(mlb[ , c(4, 6, 5)], c(72, 25), 20, scalefirst = TRUE)
  