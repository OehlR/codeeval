args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("23\n496\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
txt <- readLines(args[[1]])
cat(sapply(txt, function(x) sum(as.numeric(strsplit(x,split="")[[1]]))),sep="\n")
