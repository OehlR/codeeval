args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("-10,2,3,-2,0,5,-15\n2,3,-2,-1,10\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=",")[[1]])
  max <- 0
  for (window in length(x):1) {
    scan <- length(x)-window+1
    for (push in 1:scan) {
      s <- sum(x[push:(push+window-1)]) 
      if(s>max) max<-s
    }
  }
  cat(max,sep="\n")
}
close(con)



