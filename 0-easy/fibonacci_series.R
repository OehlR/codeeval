args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("5\n12\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
fib <- function(n) {
  res <- NULL
  if (n==0) {
    res <- 0
  } else if(n==1) {
    res <- 1  
  } else {
    res <- fib(n-1)+fib(n-2)    
  }
  return(res)
}

txt <- readLines(args[[1]])
cat(sapply(txt, function(x) fib(as.numeric(x))),sep="\n")
  