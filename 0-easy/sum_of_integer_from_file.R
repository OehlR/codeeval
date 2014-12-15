args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("5\n12\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
s<-numeric(1)
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  s <- s+as.numeric(l)
  ## Insert some if statement logic here
}
close(con)
cat(s)