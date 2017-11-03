args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("10\n20\n100\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

getPrimesIn <- function(n) {
  sqs <- c(2:n)
  begin <- 2
  res <- NULL
  while (begin*begin < n) {
    res <- c(res,sqs[1])
    sqs <- sqs[-(which(sqs %% begin ==0))]
    begin <- sqs[1]
  }
  c(res,sqs)
}

con <- file(args[[1]], "r") 
while(length(l <- as.numeric(readLines(con, n = 1, warn = FALSE))) > 0) {
  cat(paste(getPrimesIn(l),collapse=","),sep="\n")  
}
close(con)
