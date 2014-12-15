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

### SOLUTION 1 : 31.764 ranking points
# txt <- readLines(args[[1]])
# cat(sapply(txt, function(x) fib(as.numeric(x))),sep="\n")

### SOLUTION 2 : 31.638 ranking points
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(fib(as.numeric(l)),"\n")
}
close(con)
