args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("6\n153\n351\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split="")[[1]])
  cat(ifelse(l==sum(x^length(x)),"True","False"),sep="\n")
}
close(con)


