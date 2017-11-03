args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('a b c d 5\ne f g h 2\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

l <- strsplit(readLines(args[[1]], warn = FALSE),split=" ")
for(i in l) {
  if(as.numeric(i[length(i)]) < length(i)) cat(i[length(i)-as.numeric(i[length(i)])],sep="\n")
}



