args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('some line with text\nanother line\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=" ")[[1]]
  cat(x[length(x)-1],sep="\n")
}
close(con)

