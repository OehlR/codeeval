args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('2,3,1,0,-4,-1\n0,-1,3,-2\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x<-as.numeric(strsplit(l,split=",")[[1]])
  cat(sum(combn(x,4,sum)==0),sep="\n")   
}
close(con)








