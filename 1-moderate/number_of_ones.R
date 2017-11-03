args <- commandArgs(trailingOnly=TRUE)

con <- file(args[[1]], "r")   
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(sum(as.integer(intToBits(56))),sep="\n")  
}
close(con)

