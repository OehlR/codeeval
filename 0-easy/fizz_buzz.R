args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('3 5 10\n2 7 15\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=" ")[[1]])
  v <- 1:x[3]
  idsf <- (v %% x[1])==0
  idsb <- (v %% x[2])==0
  v[idsf] <- "F"
  v[idsb] <- "B"
  if (sum(idsf & idsb)>0) v[idsf & idsb] <- "FB"
  cat(paste(v,collapse=" "),sep="\n")
}
close(con)
