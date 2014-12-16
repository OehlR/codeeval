args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("1\n7\n22\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  stop=FALSE
  parsed <- NULL
  while(!stop) {
    l <- as.character(sum(as.numeric(strsplit(l,split="")[[1]])^2))
    if(as.numeric(l)==1) {
      cat(1,sep="\n")
      stop <- TRUE
    } else {
      if(as.numeric(l) %in% parsed) {
        cat(0,sep="\n")
        stop <- TRUE
      }      
    } 
    parsed <- c(parsed,l)
  }
}
close(con)
