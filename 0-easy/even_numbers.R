args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('701\n4123\n2936\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(ifelse(as.numeric(l)%%2 == 0,1,0),sep="\n")
}
close(con)

