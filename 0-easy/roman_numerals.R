args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("159\n296\n3992\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

## BEGIN
l <- readLines(args[[1]], warn = FALSE)
cat(as.character(as.roman(l)),sep="\n")
