args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21\n24,13,14,43,41\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x<-strsplit(l,split=",")[[1]]
  ids1 <- grep("[0-9]",x,invert=T)
  if(length(ids1)>0) cat(paste(x[ids1],collapse=","),sep="")
  ids2 <- grep("[0-9]",x)
  if(length(ids1)>0 & length(ids2)>0) cat("|",sep="")
  if(length(ids2)>0) cat(paste(x[ids2],collapse=","),sep="")
  cat("\n",sep="")
}
close(con)

l="24,13,14,43,41"
l <- "8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21"
x<-strsplit(l,split=",")[[1]]
ids1 <- grep("[0-9]",x,invert=T)
if(length(ids1)>0) cat(paste(x[ids1],collapse=","),sep="")
ids2 <- grep("[0-9]",x)
if(length(ids1)>0 & length(ids2)>0) cat("|",sep="")
if(length(ids2)>0) cat(paste(x[ids2],collapse=","),sep="")


,x[grep("^[0-9]+$",x,invert=T)]
cat(x[which.max(nchar(x))],sep="\n")


