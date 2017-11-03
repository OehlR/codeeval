args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("9 0 6 | 15 14 9\n5 | 8\n13 4 15 1 15 5 | 1 4 15 14 8 2\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(strsplit(l,split=" | ",fixed=T)[[1]],split=" ")
  cat(paste(as.numeric(x[[1]])*as.numeric(x[[2]]),collapse=" "),sep="\n")
}
close(con)