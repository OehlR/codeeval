args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('1,2,3,4,5;2
1,2,3,4,5;3
',file=f<-tempfile())
args<-list(f)
#unlink(f)
}


con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=";")[[1]]
  sequence <- strsplit(x[[1]],split=",")[[1]]
  k <- as.numeric(x[[2]])
  n <- length(sequence)
  if(k<n) {
    startpos <- seq(1,n,by=k)
    if(startpos[length(startpos)] > (n-k+1)) startpos <- startpos[-length(startpos)]
    for (i in startpos) {
      sequence[i:(i+(k-1))] <- rev(sequence[i:(i+(k-1))])
    }
  }
  cat(paste(sequence,collapse=","),sep="\n")
}
close(con)



