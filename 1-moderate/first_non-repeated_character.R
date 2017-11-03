args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("yellow\ntooth\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x<-strsplit(l,split="")[[1]]
  cat(x[min(which(x %in% names(table(x)[table(x)==1])))],sep="\n")
}
close(con)
