args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("3 3 9 1 6 5 8 1 5 3\n9 2 9 9 1 8 8 8 2 1 1\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  l <- strsplit(l,split=" ")[[1]]
  x <- table(l)
  cat(ifelse(sum(ids <- x==1)>0,which(l==min(names(x[ids]))),0),sep="\n")
}
close(con)

