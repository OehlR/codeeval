args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("thisTHIS\nAAbbCCDDEE\nN\nUkJ\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split="")[[1]]
  cat(paste("lowercase:",format(round(sum(x %in% letters)/length(x)*100,2),nsmall=2),"uppercase:",format(round(sum(x %in% LETTERS)/length(x)*100,2),nsmall=2),sep=" "),sep="\n")
}
close(con)

