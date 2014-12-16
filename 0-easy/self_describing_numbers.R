args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("2020\n22\n1210\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  val <- as.numeric(strsplit(l,split="")[[1]])
  df <- data.frame(table(val))
  res <- TRUE
  for (i in (1:nchar(l))-1) {
    if(length(x <- df[df$val==i,2])>0) {
      if(!x==val[i+1]) res <- FALSE
    } else {
      if (val[i+1]>0) res <- FALSE
    }
  }
  cat(ifelse(res==TRUE,1,0),sep="\n")
}
close(con)
