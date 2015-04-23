# Rdsm server code

# author:  Norm Matloff

# globals:
#
#    cons:  connections to the clients
#    ncon:  number of clients
#    barr:  barrier; consists of a single integer, the number of clients
#       that have checked in
#    locks:  lock variables; each is a list, showing which connections
#       are using or waiting for the lock, current user in element 1

# server; handles ncon clients at given port; ntrans is for debugging,
# directing the server to go into browser mode after ntrans client
# transactions, with 0 meaning never
srvr <- function(port=2000,ncon=2,ntrans=0) {
   cons <<- vector(mode="list",length=ncon)  # list of connections
   ncon <<- ncon
   on.exit(lapply(cons,close))
   options("timeout"=600)  # to avoid connections dying while we debug
   barr <<- 0  # init barrier
   locks <<- list()
   # make connections with the clients
   for (i in 1:ncon) {
      cons[[i]] <<-
      socketConnection(port=port,server=T,blocking=T,open="a+b")
      checkin <- unserialize(cons[[i]])
      if (length(checkin$locks) > 0) makelocks(checkin$locks)
   }
   # send ACKs separately, to insure that the barrier and locks are
   # ready before the app threads start
   for (i in 1:ncon) {
      # send the client its ID number, and the group size
      serialize(c(i,ncon),cons[[i]])
   }
   # main loop
   tcount <- 0  # count of client transactions
   repeat {
      # any clients still there?
      if (length(cons) == 0) break
      # any service requests?
      rdy <- which(socketSelect(cons))
      if (length(rdy) > 0) {
         # take the first, but in later versions, randomize or cycle 
         con <- cons[[rdy[1]]]  
         tcount <- tcount + 1
         if (tcount == ntrans) browser()
         # read client request
         req <- unserialize(con)
         reqtype <- req$reqtype
         req$reqtype <- NULL
         switch(reqtype,
            "new"=newdsm(req),
            "get"=dsmget(req,con), 
            "put"=dsmput(req), 
            "barrinc"=barrinc(),
            "lock"=lock(req$lockname,con),
            "unlock"=unlock(req$lockname),
            "fa"=fa(req,con),
            "qget"=qg(req,con),
            "qput"=qp(req),
            "quit"=quit(con))
      }
   }
}

newdsm <- function(rq) {
   rq$req <- NULL
   assign(rq$varname,rq,pos=.GlobalEnv)
}

# generic dsmget()
dsmget <- function(x,...) UseMethod("dsmget")

# generic dsmput()
dsmput <- function(x) UseMethod("dsmput")

# dsmget() method for vectors
dsmget.dsmv <- function(rq,cn) {
   # check for "wild cards" in subscripts
   subs <- rq$subs
   var <- get(rq$varname)
   if (subs[1]==0) subs <- 1:length(var$val)
   serialize(var$val[subs],cn)
}

# dsmput() method for vectors
dsmput.dsmv <- function(rq) {
   # check for "wild cards" in subscripts
   subs <- rq$subs
   var <- get(rq$varname)
   if (subs[1]==0) subs <- 1:length(var$val)
   var$val[subs] <<- rq$val
}

# dsmget() method for matrices
dsmget.dsmm <- function(rq,cn) {
   subs1 <- rq$subs1
   subs2 <- rq$subs2
   var <- get(rq$varname)
   # check for "wild cards" in subscripts
   if (subs1[1]==0) subs1 <- 1:nrow(var$val)
   if (subs2[1]==0) subs2 <- 1:ncol(var$val)
   serialize(var$val[subs1,subs2],cn)
}

# dsmput() method for matrices
dsmput.dsmm <- function(rq) {
   subs1 <- rq$subs1
   subs2 <- rq$subs2
   var <- get(rq$varname)
   # check for "wild cards" in subscripts
   if (subs1[1]==0) subs1 <- 1:nrow(var$val)
   if (subs2[1]==0) subs2 <- 1:ncol(var$val)
   var$val[subs1,subs2] <<- rq$val
}

# barrier handler
barrinc <- function() {
   barr <<- barr + 1
   if (barr == ncon) {
      for (con in cons) writeLines("resume",con)
      barr <<- 0
   }
}

makelocks <- function(locknames) {
   for (lnm in locknames) locks[[lnm]] <<- list()
}

# lock handler
lock <- function(lockname,con) {
   if (length(locks[[lockname]]) == 0)  {  # lock is unlocked
      locks[[lockname]][[1]] <<- con
      writeLines("resume",con)
   } else {  # lock is locked, so join the queue
      lng <- length(locks[[lockname]])
      locks[[lockname]][[lng+1]] <<- con
   }
}

# unlock handler
unlock <- function(lockname) {
   # current connection done with lock, so remove 
   locks[[lockname]] <<- locks[[lockname]][-1]  
   if (length(locks[[lockname]]) > 0)  # others are waiting for lock 
      writeLines("resume",locks[[lockname]][[1]])
}

# fetch-and-add; see fa() in Clnt.r
fa <- function(rq,cn) {
   fav <- get(rq$fav)
   oldval <- fav$val
   fav$val <<- oldval + rq$inc
   serialize(oldval,cn)
}

# remove head of queue, return to client
qg <- function(rq,cn) {
   qvar <- get(rq$qn)
   repeat {
      if (length(qvar$val) > 0) break
   }
   hd <- qvar$val[1,]
   qvar$val <<- qvar$val[-1,,drop=F]
   serialize(hd,cn)
}

# append task to end of queue
qp <- function(rq) {
   qvar <- get(rq$qn)
   qvar$val <<- rbind(qvar$val,rq$val)
}

# client cn quits
quit <- function(cn) {
   tmp <- match(cn,cons)
   cons[[tmp[1]]] <<- NULL
}
