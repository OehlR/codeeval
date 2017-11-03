args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('abcabcabcabc\nbcbcbcbcbcbcbcbcbcbcbcbcbcbc\ndddddddddddddddddddd\nadcdefg\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(ifelse(length(unique(x<-table(strsplit(l,split="")[[1]])))==1,length(x),sum(x)),sep="\n")
}
close(con)
