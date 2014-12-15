args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("1,2,3,4;4,5,6\n20,21,22;45,46,47\n7,8,9;8,9,10,11,12\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(strsplit(l,split=";")[[1]],",")  
  cat(paste(x[[1]][x[[1]] %in% x[[2]]],collapse=","),sep="\n")    
}
close(con)
