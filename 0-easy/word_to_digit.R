args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("zero;two;five;seven;eight;four\nthree;seven;eight;nine;two\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  l <- strsplit(l,split=";")[[1]]
  x <- c("zero"=0,"one"=1,"two"=2,"three"=3,"four"=4,"five"=5,"six"=6,"seven"=7,"eight"=8,"nine"=9)
  cat(paste(x[l],collapse=""),sep="\n")
}
close(con)

