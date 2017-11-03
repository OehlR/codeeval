args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('2\nHello World\nCodeEval\nQuick Fox\nA\nSan Francisco\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

l <- readLines(args[[1]], warn = FALSE)
odr <- l[order(nchar(l),decreasing=TRUE)]
cat(odr[1:as.numeric(l[1])],sep="\n")



