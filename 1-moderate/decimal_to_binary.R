args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("2\n10\n67\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

dectobin <- function(y) {
  # find the binary sequence corresponding to the decimal number 'y'
  stopifnot(length(y) == 1, mode(y) == 'numeric')
  q1 <- (y / 2) %/% 1
  r <- y - q1 * 2
  res = c(r)
  while (q1 >= 1) {
    q2 <- (q1 / 2) %/% 1
    r <- q1 - q2 * 2
    q1 <- q2
    res = c(r, res)
  }
  return(res)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(paste(dectobin(as.numeric(l)),collapse=""),sep="\n")
}
close(con)



