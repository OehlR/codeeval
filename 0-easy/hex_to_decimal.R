args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("9f\n11\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(strtoi(l, 16L),sep="\n")
}
close(con)
