args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("1,2,3,4,6;5\n2,4,5,6,9,11,15;20\n1,2,3,4;50\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- tolower(strsplit(l,split="")[[1]])
  ids <- !letters %in% x
  cat(ifelse(sum(ids)==0,"NULL",paste(letters[ids],collapse="")),sep="\n")    
}
close(con)