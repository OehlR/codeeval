args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2\nprogramming first The language;3 2 1\nprograms Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(strsplit(l,split=";")[[1]],split=" ")
  x[[2]] <- c(x[[2]],setdiff(1:length(x[[1]]),x[[2]]))
  cat(paste(x[[1]][order(as.numeric(x[[2]]))],collapse=" "),sep="\n")
}
close(con)
