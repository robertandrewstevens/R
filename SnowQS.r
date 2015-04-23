# sorts the array x on the cluster cls
qs <- function(cls,x) {
   pvt <- x[1]  # pivot
   chunks <- list()
   chunks[[1]] <- x[x <= pvt]  # low pile
   chunks[[2]] <- x[x > pvt]  # high pile
   # now parcel out the piles to the clusters, which sort the piles
   rcvd <- clusterApply(cls,chunks,sort)
   lx <- length(x)
   lc1 <- length(rcvd[[1]])
   lc2 <- length(rcvd[[2]])
   y <- vector(length=lx)
   if (lc1 > 0) y[1:lc1] <- rcvd[[1]]
   if (lc2 > 0) y[(lc1+1):lx] <- rcvd[[2]]
   return(y)
}

cls <- makeCluster(type="SOCK",c("pc48","pc49"))
x <- runif(10000000)
print(system.time(qs(cls,x)))
