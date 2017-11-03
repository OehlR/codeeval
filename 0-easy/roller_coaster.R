args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("To be, or not to be: that is the question.\nWhether 'tis nobler in the mind to suffer.\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- tolower(strsplit(l,split="")[[1]])
  ltr <- which(x %in% letters)
  x[ltr[seq(1, length(ltr), 2)]] <- toupper(x[ltr[seq(1, length(ltr), 2)]])
  cat(paste(x,collapse=""),sep="\n")
}
close(con)



