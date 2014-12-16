args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('Hello world!\nJavaScript language 1.8\nA letter\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(gsub("([a-z]*)([A-Z]*)", "\\U\\1\\L\\2", l, perl=TRUE),sep="\n")
}
close(con)

