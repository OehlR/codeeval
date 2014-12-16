args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("Hello World,r\n\nHello CodeEval,E\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=",")[[1]]
  x <- strsplit(l,split=",")[[1]]
  g <- grep(x[[2]],strsplit(x[[1]],split="")[[1]])
  cat(ifelse(length(g)==0,0,max(g))-1,"\n")
}
close(con)
