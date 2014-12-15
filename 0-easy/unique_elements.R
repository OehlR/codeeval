args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("1,1,1,2,2,3,3,4,4\n2,3,4,5,5\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(paste(unique(strsplit(l,split=",")[[1]]),collapse=","),"\n")
  ## Insert some if statement logic here
}
close(con)
