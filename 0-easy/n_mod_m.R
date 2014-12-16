args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("20,6\n2,3\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=",")[[1]])
  cat(x[[1]]-(floor(x[[1]]/x[[2]])*x[[2]]),sep="\n")
}
close(con)

