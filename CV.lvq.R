CV.lvq <- function() {
  res <- fgl$type
  for(i in sort(unique(rand))) {
    cat("doing fold", i, "\n")
    cd0 <- lvqinit(fgl0[rand != i,  ], fgl$type[rand != i], prior = rep(1, 6)/6, k = 3)
    cd1 <- olvq1(fgl0[rand != i,  ], fgl$type[rand != i], cd0)
    cd1 <- lvq3(fgl0[rand != i,  ], fgl$type[rand != i], cd1, niter = 10000)
    res[rand == i] <- lvqtest(cd1, fgl0[rand == i,  ])
  }
  res
}