args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('(25, 4) (1, -6)\n(47, 43) (-25, -11)\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(unlist(regmatches(l, gregexpr('-?[0-9.]+', l))))
  cat(sqrt((x[1]-x[3])^2+(x[2]-x[4])^2),sep="\n")
}
close(con)


