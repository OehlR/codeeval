  args <- commandArgs(trailingOnly=TRUE)
  
  if(F) {
    cat('3 1\n100 100\n',file=f<-tempfile())
    args<-list(f)
    #unlink(f)
  }
  
  con <- file(args[[1]], "r") 
  while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
    x <- as.numeric(strsplit(l,split=" ")[[1]])
    N <- x[1]
    M <- x[2]
    doors <- rep(TRUE,N)   
    if (M>1) {
      for (i in 1:(M-1)) {
        # first pass
        ids <- seq(2,N,by=2)
        doors[ids] <- FALSE
        # second pass
        ids <- seq(3,N,by=3)
        doors[ids] <- !doors[ids]
      }      
    }
    doors[N] <- !doors[N]
    cat(sum(doors),sep="\n")  
  }
  close(con)
