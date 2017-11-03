args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("40 40 40 40 29 29 29 29 29 29 29 29 57 57 92 92 92 92 92 86 86 86 86 86 86 86 86 86 86\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=" ")[[1]])
  val <- x[1]
  nb <- 1
  res <- NULL
  if(length(x)>1) {
    for(i in 2:length(x)) {
      if(x[i]==x[i-1]) {
        nb <- nb+1
      } else {
        res <- c(res,nb,val)
        val <- x[i]      
        nb <- 1
      }
    } 
  }
  res <- c(res,nb,val)
  cat(paste(res,collapse=" "),sep="\n")
}
close(con)

