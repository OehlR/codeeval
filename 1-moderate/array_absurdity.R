args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("5;0,1,2,3,0\n20;0,1,10,3,2,4,5,7,6,8,11,9,15,12,13,4,16,18,17,14\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(strsplit(l,split=";")[[1]],split=",")
  cat(names(table(x[[2]]))[table(x[[2]])==2],sep="\n")  
}
close(con)
