args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('1 2 3 4 5 6 7 8 9 : 0-8\n1 2 3 4 5 6 7 8 9 10 : 0-1, 1-3\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=" : ")[[1]]
  num <- strsplit(x[[1]],split=" ")[[1]]
  pos <- strsplit(strsplit(x[[2]],split=",")[[1]],split="-")
  for (i in 1:length(pos)) {
    num[as.numeric(pos[[i]])+1] <- num[rev(as.numeric(pos[[i]])+1)]  
  }
  cat(paste(num,collapse=" "),sep="\n")
}
close(con)
