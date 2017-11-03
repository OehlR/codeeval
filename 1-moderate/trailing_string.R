args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("Hello World,World\nHello CodeEval,CodeEval\nSan Francisco,San Jose\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=",")[[1]]
  cat(ifelse(length(grep(x[[2]],x[[1]]))==1,1,0),sep="\n")  
}
close(con)
