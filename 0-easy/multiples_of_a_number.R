args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('13,8\n17,16\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=",")[[1]])
  res <- i <- 0
  while(res < x[1]) {
    i <- i+1
    res <- x[2]*i
  }
  cat(res,sep="\n")  
}
close(con)
