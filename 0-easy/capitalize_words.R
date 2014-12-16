args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('Hello world\njavaScript language\na letter\n1st thing\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(gsub("(\\w)(\\w*)", "\\U\\1\\E\\2", l, perl=TRUE),sep="\n")
}
close(con)

