args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("3413289830 a-bcdefghij\n776 a+bc\n12345 a+bcde\n1232 ab+cd\n90602 a+bcde\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(strsplit(l,split=" ")[[1]],split="")
  pos <- which(x[[2]]=="+" | x[[2]]=="-")
  cat(eval(parse(text=paste0(paste(x[[1]][1:(pos-1)],collapse=""),x[[2]][pos],paste(x[[1]][pos:(length(x[[1]]))],collapse=""),collapse=""))),sep="\n")
}
close(con)

