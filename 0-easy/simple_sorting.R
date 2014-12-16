args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('70.920 -38.797 14.354 99.323 90.374 7.581\n-37.507 -3.263 40.079 27.999 65.213 -55.552\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=" ")[[1]])
  cat(paste0(sprintf("%.3f",sort(x)),collapse=" "),sep="\n")
}
close(con)

