args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('a b c d
a b c d e f g h i j k l m n o p
a b c d e f g h i\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=" ")[[1]]
  n<-sqrt(length(x))
  cat(paste(as.vector(apply(matrix(x,n,n,byrow = T),2,rev)),collapse=" "),sep="\n")  
}
close(con)
