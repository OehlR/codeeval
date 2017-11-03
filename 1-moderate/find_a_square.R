args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('(1,6), (6,7), (2,7), (9,1)
(4,1), (3,4), (0,5), (1,2)
(4,6), (5,5), (5,6), (4,5)\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x<-strsplit(l,split=", ")[[1]]
  thepoints <- lapply(x,function(y) strsplit(gsub("\\((.*)\\)","\\1",y),split=",")[[1]])
  cat(ifelse(length(unique(dist(matrix(unlist(thepoints),4,2,byrow=TRUE))))==2,"true","false"),sep="\n")  
}
close(con)
