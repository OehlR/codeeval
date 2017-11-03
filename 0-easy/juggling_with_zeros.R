args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("00 0 0 00 00 0\n00 0\n00 0 0 000 00 0000000 0 000\n0 000000000 00 00\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=" ")[[1]]
  n <- length(x)
  if(n%%2==0) {
    res <- NULL
    s <- seq(1,n,by=2)
    for (pos in s) {
      if(x[pos]=="00") {
        x[pos+1] <- gsub("0","1",x[pos+1])
      }
      res <- c(res,x[pos+1])
    }
  }
  cat(sum(2^(which(rev(unlist(strsplit(paste(res,collapse=""), "")) == 1))-1)),sep="\n")
}
close(con)

