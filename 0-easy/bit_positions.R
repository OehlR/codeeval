args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("86,2,3\n125,1,2\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,",")[[1]])
  b <- as.integer(intToBits(x[1]))
  cat(ifelse(b[x[2]]==b[x[3]],"true","false"),sep="\n")
}
close(con)


