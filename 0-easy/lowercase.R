args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("HELLO CODEEVAL\nThis is some text\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
txt <- readLines(args[[1]])
cat(tolower(txt),sep="\n")

